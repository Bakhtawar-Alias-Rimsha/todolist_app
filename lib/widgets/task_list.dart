import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskProvider>().tasks;

    return tasks.isEmpty
        ? const Center(child: Text("🎉 No tasks yet! Add one."))
        : ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(task: tasks[index]);
      },
    );
  }
}
