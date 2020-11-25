import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Diário On-line"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  // todo o código do socket se encontra no home_controller.dart
  final _textController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller
        .getNotes(); //carrega as notas já guardadas no banco, trazidas com o socket
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Observer(
            builder: (context) => GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.height / 3),
              itemCount: controller.notes.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/note', arguments: controller.notes[index]);
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridTile(
                      footer: controller.notes[index]["text"]
                                  .toString()
                                  .length >
                              25
                          ? Text(controller.notes[index]["text"]
                              .toString()
                              .replaceRange(25, null, '... '))
                          : Text(controller.notes[index]["text"].toString()),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat('dd').format(
                                DateTime.parse(
                                    controller.notes[index]["createdAt"]),
                              ),
                            ),
                            Text(
                              DateFormat('MMMM').format(
                                DateTime.parse(
                                    controller.notes[index]["createdAt"]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Olá, como você se sente hoje?'),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancelar'),
                  ),
                  FlatButton(
                    onPressed: () {
                      controller.createNote(_textController.text.trim());
                      _textController.clear();
                      Navigator.pop(context);
                    },
                    child: Text('Enviar'),
                  ),
                ],
                content: TextField(
                  controller: _textController,
                  autocorrect: false,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Fale sobre seu dia...',
                  ),
                  minLines: 3,
                  maxLines: 100,
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
