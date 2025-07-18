import 'package:smart_app_modular/modules/to_do/models/todo_model.dart';

abstract class TodoEvent {}

class AddTask extends TodoEvent {
  final TodoModel task;
  AddTask(this.task);
}

class RemoveTask extends TodoEvent {
  final int index;
  RemoveTask(this.index);
}

class UpdateTask extends TodoEvent {
  final int index;
  final TodoModel newTask;

  UpdateTask({required this.newTask, required this.index});
}
