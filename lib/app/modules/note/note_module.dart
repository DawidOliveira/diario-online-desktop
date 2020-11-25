import 'package:desktop/app/modules/home/home_controller.dart';
import 'package:desktop/app/modules/home/home_page.dart';
import 'package:desktop/app/shared/note/repositories/note_repository.dart';

import 'note_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'note_page.dart';

class NoteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NoteController(i.get<HomeController>())),
        Bind((i) => HomeController(i.get<NoteRepository>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => NotePage()),
        ModularRouter('/home', child: (context, args) => HomePage()),
      ];

  static Inject get to => Inject<NoteModule>.of();
}
