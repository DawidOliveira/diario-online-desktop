import 'package:desktop/app/modules/note/note_controller.dart';
import 'package:desktop/app/modules/note/note_page.dart';
import 'package:desktop/app/shared/note/repositories/note_repository.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<NoteRepository>())),
        Bind((i) => NoteRepository()),
        Bind((i) => NoteController(i.get<HomeController>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter('/note', child: (context, args) => NotePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
