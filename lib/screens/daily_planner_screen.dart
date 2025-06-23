// lib/screens/daily_planner_screen.dart

import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';

class DailyPlannerScreen extends StatefulWidget {
  const DailyPlannerScreen({super.key});

  @override
  State<DailyPlannerScreen> createState() => _DailyPlannerScreenState();
}

class _DailyPlannerScreenState extends State<DailyPlannerScreen> {
  List<Task> tasks = List.generate(
    5,
    (i) => Task(id: '$i', title: 'Tasca ${i + 1}', difficulty: (i % 3) + 1),
  );

  Future<void> _editTask(Task task) async {
    final controller = TextEditingController(text: task.title);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Edita la tasca'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Títol de la tasca'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(null),
            child: const Text('Cancel·la'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(controller.text),
            child: const Text('Desa'),
          ),
        ],
      ),
    );
    if (result != null && result.trim().isNotEmpty) {
      setState(() {
        final idx = tasks.indexWhere((t) => t.id == task.id);
        if (idx != -1) {
          tasks[idx] = Task(
            id: task.id,
            title: result.trim(),
            difficulty: task.difficulty,
          );
        }
      });
    }
  }

  Future<void> _addTask() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Nova tasca'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Títol de la tasca'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(null),
            child: const Text('Cancel·la'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(controller.text),
            child: const Text('Afegeix'),
          ),
        ],
      ),
    );
    if (result != null && result.trim().isNotEmpty) {
      setState(() {
        tasks.add(Task(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: result.trim(),
          difficulty: 1,
        ));
      });
    }
  }

  void _deleteTask(String taskId) {
    setState(() => tasks.removeWhere((t) => t.id == taskId));
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      final moved = tasks.removeAt(oldIndex);
      tasks.insert(newIndex, moved);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Planificació del dia')),
      body: ReorderableListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        itemCount: tasks.length,
        onReorder: _onReorder,
        buildDefaultDragHandles: false,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Dismissible(
            key: ValueKey(task.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.redAccent,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (_) => _deleteTask(task.id),
            child: ReorderableDelayedDragStartListener(
              index: index,
              child: GestureDetector(
                onDoubleTap: () => _editTask(task),
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    title: TaskCard(task: task),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: const Icon(Icons.add),
        tooltip: 'Afegeix una nova tasca',
      ),
    );
  }
}
