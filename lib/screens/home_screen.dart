import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_list.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskCount = context.watch<TaskProvider>().tasks.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("📝 Task Manager"),
        centerTitle: true,
        elevation: 4,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Text(
              "You have $taskCount tasks",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          const Expanded(child: TaskList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTaskScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
