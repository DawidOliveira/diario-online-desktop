import 'package:desktop/app/modules/home/home_page.dart';
import 'package:desktop/app/modules/note/note_page.dart';
import 'package:desktop/app/modules/onboarding/onboarding_module.dart';
import 'package:desktop/app/shared/note/repositories/note_repository.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:desktop/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => NoteRepository()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: OnboardingModule()),
        ModularRouter('/note', child: (context, args) => NotePage()),
        ModularRouter('/home', child: (context, args) => HomePage()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
