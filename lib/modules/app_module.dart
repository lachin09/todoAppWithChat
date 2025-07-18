import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_app_modular/%20services/dialog_service.dart';
import 'package:smart_app_modular/modules/auth/auth_module.dart';
import 'package:smart_app_modular/modules/chat/chat_module.dart';
import 'package:smart_app_modular/modules/home/home_module.dart';
import 'package:smart_app_modular/modules/to_do/to_do_module.dart';
import 'package:smart_app_modular/routes/routes.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<DialogService>(DialogService.new);
  }

  @override
  void routes(r) {
    r.module(Routes.home.module, module: HomeModule());

    r.module(Routes.auth.module, module: AuthModule());
    r.module(Routes.toDo.module, module: ToDoModule());
    r.module(Routes.chat.module, module: ChatModule());
  }
}
