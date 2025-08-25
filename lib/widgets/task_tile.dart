import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(task.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => context.read<TaskProvider>().deleteTask(task.id),
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null,
            fontSize: 16,
          ),
        ),
        trailing: Checkbox(
          value: task.isDone,
          onChanged: (_) => context.read<TaskProvider>().toggleTask(task.id),
        ),
      ),
    );
  }
}
