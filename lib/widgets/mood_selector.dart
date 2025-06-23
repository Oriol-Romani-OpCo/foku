import 'package:flutter/material.dart';

class MoodSelector extends StatelessWidget {
  const MoodSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Tria el teu estat d\'ànim:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text('😄'),
            Text('🙂'),
            Text('😐'),
            Text('😕'),
            Text('😣'),
          ],
        ),
      ],
    );
  }
}