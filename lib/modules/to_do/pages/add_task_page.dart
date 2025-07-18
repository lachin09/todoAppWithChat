import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:smart_app_modular/%20services/dialog_service.dart';
import 'package:smart_app_modular/%20services/navigation_services.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import '../models/todo_model.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    final bloc = Modular.get<TodoBloc>();
    final dialog = Modular.get<DialogService>();

    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(title: const Text("ToDo List")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<TodoBloc, TodoState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        final task = state.tasks[index];
                        return ListTile(
                          title: Text(task.title),
                          subtitle: Text(task.description),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () async {
                                  final result = await dialog.showEditDialog(
                                    context,
                                    task.title,
                                    task.description,
                                  );
                                  if (result != null) {
                                    final updated = TodoModel(
                                      title: result['title']!,
                                      description: result['desc']!,
                                    );
                                    bloc.add(
                                      UpdateTask(
                                        index: index,
                                        newTask: updated,
                                      ),
                                    );
                                  }
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () async {
                                  final confirmed = await dialog.confirmDelete(
                                    context,
                                  );
                                  if (confirmed) {
                                    bloc.add(RemoveTask(index));
                                  }
                                },
                              ),
                            ],
                          ),
                          onTap: () {
                            NavigationService.toTaskDetails(task);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  final title = titleController.text.trim();
                  final desc = descController.text.trim();
                  if (title.isNotEmpty && desc.isNotEmpty) {
                    bloc.add(
                      AddTask(TodoModel(title: title, description: desc)),
                    );
                    titleController.clear();
                    descController.clear();
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
