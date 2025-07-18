// import 'package:smart_app_modular/modules/to_do/models/todo_model.dart';

// class TodoState {
//    final TodoModel task;

//   const TodoState({required this.task});

//   TodoState copyWith({List<TodoModel>? tasks}) {
//     return TodoState(task: tasks ?? this.task);
//   }
// }

import 'package:smart_app_modular/modules/to_do/models/todo_model.dart';

class TodoState {
  final List<TodoModel> tasks;

  const TodoState({required this.tasks});

  TodoState copyWith({List<TodoModel>? tasks}) {
    return TodoState(tasks: tasks ?? this.tasks);
  }
}
