import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';
import 'task_list_screen.dart';

class DailyPlannerScreen extends StatelessWidget {
  const DailyPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Tasques de prova
    final tasks = List.generate(
      5,
      (i) => Task(id: '$i', title: 'Tasca ${i + 1}', difficulty: (i % 3) + 1),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Planificació del dia')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Inserim cada TaskCard
          ...tasks.map((t) => TaskCard(task: t)),
          const SizedBox(height: 20),
          // Botó per navegar a la llista completa
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TaskListScreen()),
              );
            },
            child: const Text('Veure totes les tasques'),
          ),
        ],
      ),
    );
  }
}
