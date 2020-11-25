import 'dart:io';

import 'package:desktop/app/shared/note/repositories/note_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  NoteRepository _noteRepository;

  @observable
  IO.Socket socket;

  ObservableList<dynamic> notes = ObservableList<dynamic>();

  @action
  _HomeControllerBase(NoteRepository noteRepository) {
    _noteRepository = noteRepository;
    socket = IO.io(
        Platform.isAndroid ? "http://10.0.2.2:3000" : "http://localhost:3000",
        <String, dynamic>{
          'transports': ['websocket'],
          'autoConnect': false,
        }); //instancia a conexão
    socket.connect(); //realiza a conexão de fato
    socket.on(
        "connect",
        (data) => print(
            'Conectado com o server')); //mostra quando a conexão foi feita
    socket.on("add_note_in_list", (data) {
      notes.add(data);
    }); //ouve quando há alguma alteração no backend, sendo essa alteração: adicionar algum dado na tabela do bd
    socket.on("remove_note_in_list", (data) {
      notes.removeWhere((note) => note["id"] == data);
    }); //ouve quando há alguma alteração no backend, sendo essa alteração: remover algum dado na tabela do bd
  }

  @action
  Future getNotes() async {
    notes = (await _noteRepository.getNotes()).asObservable();
  }

  @action
  Future createNote(String text) async {
    try {
      final response = await _noteRepository.createNote(text);
      socket.emit("add_note", response);
    } catch (err) {
      print(err);
    }
  }

  @action
  Future removeNote(int id) async {
    try {
      final response = await _noteRepository.deleteNote(id);
      socket.emit("remove_note", response);
    } catch (err) {
      print(err);
    }
  }
}
