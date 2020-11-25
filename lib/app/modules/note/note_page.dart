import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'note_controller.dart';

class NotePage extends StatefulWidget {
  final String title;
  const NotePage({Key key, this.title = "Note"}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends ModularState<NotePage, NoteController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final dados = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            DateFormat('dd MMMM').format(DateTime.parse(dados["createdAt"]))),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Row(
                    children: [
                      Icon(
                        Icons.warning,
                        color: Colors.yellow[600],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Aviso!')
                    ],
                  ),
                  content: Text('Você tem certeza que deseja apagar?'),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancelar'),
                    ),
                    FlatButton(
                      onPressed: () {
                        controller.removeNote(dados["id"]).then((_) =>
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/home', (route) => false));
                      },
                      child: Text(
                        'Excluir',
                        style: TextStyle(color: Theme.of(context).errorColor),
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Text(dados["text"]),
        ),
      ),
    );
  }
}
