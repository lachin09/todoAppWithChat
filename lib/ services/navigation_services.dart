import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_app_modular/routes/routes.dart';
import 'package:smart_app_modular/modules/to_do/models/todo_model.dart';

class NavigationService {
  static void toTaskDetails(TodoModel task) {
    Modular.to.pushNamed(
      Routes.toDo.getRoute(Routes.toDo.todoDetails),
      arguments: task,
    );
  }

  static void toTaskList() {
    Modular.to.pushNamed(Routes.toDo.getRoute(Routes.toDo.taskList));
  }

  static void toHomePage() {
    Modular.to.navigate(Routes.home.getRoute(Routes.home.home));
  }

  static void toAddTaskPage() {
    Modular.to.pushNamed(Routes.toDo.getRoute(Routes.toDo.addTask));
  }

  static void toSettingsPage() {
    Modular.to.navigate(Routes.home.getRoute(Routes.home.settings));
  }

  static void toRegiserPage() {
    Modular.to.pushNamed(Routes.auth.getRoute(Routes.auth.register));
  }

  static void toChatPage() {
    Modular.to.pushNamed(Routes.chat.getRoute(Routes.chat.chatPage));
  }

  static void pop() {
    Modular.to.pop();
  }
}
