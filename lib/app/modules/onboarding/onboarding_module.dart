import 'package:desktop/app/modules/home/home_controller.dart';
import 'package:desktop/app/modules/home/home_page.dart';
import 'package:desktop/app/modules/note/note_controller.dart';
import 'package:desktop/app/shared/note/repositories/note_repository.dart';

import 'onboarding_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'onboarding_page.dart';

class OnboardingModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $OnboardingController,
        Bind((i) => NoteController(i.get<HomeController>())),
        Bind((i) => HomeController(i.get<NoteRepository>())),
        Bind((i) => NoteRepository()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => OnboardingPage()),
        ModularRouter('/home', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<OnboardingModule>.of();
}
