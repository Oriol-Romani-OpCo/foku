import 'package:flutter/material.dart';
import '../models/task.dart';

class PomodoroTimer extends StatelessWidget {
  final Task task;
  const PomodoroTimer({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    // Placeholder: mostrar temps restant
    return const Text('25:00');
  }
}