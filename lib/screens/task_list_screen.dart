import 'package:flutter/material.dart';
import '../widgets/pomodoro_timer.dart';
import '../models/task.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = List.generate(3, (i) => Task(id: '$i', title: 'Tasca ${i+1}', difficulty: (i%3)+1));
    return Scaffold(
      appBar: AppBar(title: const Text('Llista de tasques')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: tasks.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(tasks[i].title),
          subtitle: PomodoroTimer(task: tasks[i]),
        ),
      ),
    );
  }
}