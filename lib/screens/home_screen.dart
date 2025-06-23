import 'package:flutter/material.dart';
import '../widgets/mood_selector.dart';
import '../widgets/energy_slider.dart';
import 'daily_planner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Com et sents avui?'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Configuració',
            onPressed: () => Navigator.pushNamed(context, '/settings'),
        ),
      ],
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const MoodSelector(),
            const SizedBox(height: 20),
            const EnergySlider(),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DailyPlannerScreen())),
              child: const Text('Planifica el meu dia'),
            ),
          ],
        ),
      ),
    );
  }
}