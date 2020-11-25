import 'package:desktop/app/modules/home/home_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'note_controller.g.dart';

@Injectable()
class NoteController = _NoteControllerBase with _$NoteController;

abstract class _NoteControllerBase with Store {
  HomeController _homeController;

  _NoteControllerBase(this._homeController);

  Future removeNote(int id) async {
    _homeController.removeNote(id);
  }
}
