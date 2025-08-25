import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  final Task? task; // If null → Add, else → Update
  const AddTaskScreen({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    final taskController = TextEditingController(text: task?.title ?? "");

    return Scaffold(
      appBar: AppBar(
        title: Text(task == null ? "➕ Add Task" : "✏️ Update Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: "Task Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(task == null ? Icons.check : Icons.save),
              label: Text(task == null ? "Add Task" : "Update Task"),
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  if (task == null) {
                    context.read<TaskProvider>().addTask(taskController.text);
                  } else {
                    context
                        .read<TaskProvider>()
                        .updateTask(task!.id, taskController.text);
                  }
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
