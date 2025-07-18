abstract class RouteClass {
  final String module;
  const RouteClass(this.module);
  String getRoute(String moduleRoute) {
    if (moduleRoute.isEmpty) return module; // '/auth'
    if (moduleRoute.startsWith('/'))
      return '$module$moduleRoute'; // '/auth/register'
    return '$module/$moduleRoute';
  }

  String getModule() => module;
}

class Routes {
  static const HomeRoutes home = HomeRoutes();
  static const AuthRoutes auth = AuthRoutes();
  static const ToDoRoutes toDo = ToDoRoutes();
  static const ChatRoutes chat = ChatRoutes();
}

class HomeRoutes extends RouteClass {
  const HomeRoutes() : super('/home');
  final String home = '/';
  final String settings = '/settings';
}

class AuthRoutes extends RouteClass {
  const AuthRoutes() : super('/auth');
  final String login = '/';
  final String register = '/register';
}

class ToDoRoutes extends RouteClass {
  const ToDoRoutes() : super('/toDo');
  final String taskList = "/";
  final String addTask = "/addTask";
  final String todoDetails = "/details";
}

class ChatRoutes extends RouteClass {
  const ChatRoutes() : super("/chat");
  final String chatList = '/chatList';
  final String chatPage = '/chatPage';
}
