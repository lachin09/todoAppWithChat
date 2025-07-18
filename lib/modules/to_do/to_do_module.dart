import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:smart_app_modular/modules/to_do/bloc/todo_bloc.dart';
import 'package:smart_app_modular/modules/to_do/cubit/todo_cubit.dart';
import 'package:smart_app_modular/modules/to_do/models/todo_model.dart';
import 'package:smart_app_modular/modules/to_do/pages/add_task_page.dart';
import 'package:smart_app_modular/modules/to_do/pages/todo_detail_page.dart';
import 'package:smart_app_modular/routes/routes.dart';

class ToDoModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<TodoCubit>(TodoCubit.new);

    i.addLazySingleton(() => Hive.box<TodoModel>('tasks'));
    i.addSingleton<TodoBloc>(() => TodoBloc(i()));
  }

  @override
  void routes(r) {
    r.child(Routes.toDo.addTask, child: (_) => AddTaskPage());
    r.child(
      Routes.toDo.todoDetails,
      child: (_) {
        final task = Modular.args.data as TodoModel;
        return TodoDetailPage(tasks: task);
      },
    );
  }
}
