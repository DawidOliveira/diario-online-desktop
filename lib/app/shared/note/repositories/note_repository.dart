import 'dart:convert';
import 'dart:io';

import 'package:desktop/app/shared/note/repositories/note_repository_interface.dart';
import 'package:dio/dio.dart';

class NoteRepository implements INoteRepository {
  final String _url =
      Platform.isAndroid ? "http://10.0.2.2:3000" : "http://localhost:3000";
  @override
  Future createNote(String text) async {
    try {
      final Response response = await Dio().post(
        "$_url/note",
        data: jsonEncode({
          'text': text,
        }),
      );
      Map<String, dynamic> responseObj = {
        'id': response.data["id"],
        'text': response.data["text"],
        'createdAt': response.data["createdAt"],
        'updatedAt': response.data["updatedAt"]
      };
      return responseObj;
    } on DioError catch (err) {
      print(err);
    }
  }

  @override
  Future deleteNote(int id) async {
    try {
      final identificador = await Dio().delete("$_url/note/$id");
      return identificador.data["id"];
    } on DioError catch (err) {
      print(err);
    }
  }

  @override
  Future<List<dynamic>> getNotes() async {
    try {
      final Response response = await Dio().get("$_url/notes");
      final List<dynamic> responseObject = response.data
          .map((note) => {
                'id': note["id"],
                'text': note["text"],
                'createdAt': note["createdAt"],
                'updatedAt': note["updatedAt"]
              })
          .toList();
      return responseObject;
    } on DioError catch (err) {
      print(err);
    }
    return [];
  }
}
