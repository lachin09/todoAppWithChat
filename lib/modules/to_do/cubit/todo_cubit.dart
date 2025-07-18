import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<String>> {
  TodoCubit() : super([]);

  void addTask(String task) {
    final updated = List<String>.from(state)..add(task);
    emit(updated);
  }
}
