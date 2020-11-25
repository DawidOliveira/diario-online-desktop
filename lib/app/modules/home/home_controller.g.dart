// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<NoteRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$_noteRepositoryAtom =
      Atom(name: '_HomeControllerBase._noteRepository');

  @override
  NoteRepository get _noteRepository {
    _$_noteRepositoryAtom.reportRead();
    return super._noteRepository;
  }

  @override
  set _noteRepository(NoteRepository value) {
    _$_noteRepositoryAtom.reportWrite(value, super._noteRepository, () {
      super._noteRepository = value;
    });
  }

  final _$socketAtom = Atom(name: '_HomeControllerBase.socket');

  @override
  IO.Socket get socket {
    _$socketAtom.reportRead();
    return super.socket;
  }

  @override
  set socket(IO.Socket value) {
    _$socketAtom.reportWrite(value, super.socket, () {
      super.socket = value;
    });
  }

  final _$getNotesAsyncAction = AsyncAction('_HomeControllerBase.getNotes');

  @override
  Future<dynamic> getNotes() {
    return _$getNotesAsyncAction.run(() => super.getNotes());
  }

  final _$createNoteAsyncAction = AsyncAction('_HomeControllerBase.createNote');

  @override
  Future<dynamic> createNote(String text) {
    return _$createNoteAsyncAction.run(() => super.createNote(text));
  }

  final _$removeNoteAsyncAction = AsyncAction('_HomeControllerBase.removeNote');

  @override
  Future<dynamic> removeNote(int id) {
    return _$removeNoteAsyncAction.run(() => super.removeNote(id));
  }

  @override
  String toString() {
    return '''
socket: ${socket}
    ''';
  }
}
