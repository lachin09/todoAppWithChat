import 'package:flutter/material.dart';
import 'package:smart_app_modular/modules/to_do/models/todo_model.dart';

class TodoDetailPage extends StatelessWidget {
  final TodoModel tasks;
  const TodoDetailPage({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tasks.title)),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(tasks.description),
      ),
    );
  }
}
