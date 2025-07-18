import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../models/todo_model.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Box<TodoModel> box;

  TodoBloc(this.box) : super(TodoState(tasks: box.values.toList())) {
    on<AddTask>((event, emit) {
      box.add(event.task);
      emit(TodoState(tasks: box.values.toList()));
    });

    on<RemoveTask>((event, emit) {
      box.deleteAt(event.index);
      emit(TodoState(tasks: box.values.toList()));
    });

    on<UpdateTask>((event, emit) {
      box.putAt(event.index, event.newTask);
      emit(TodoState(tasks: box.values.toList()));
    });
  }
}
