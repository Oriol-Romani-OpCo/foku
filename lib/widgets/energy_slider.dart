import 'package:flutter/material.dart';

class EnergySlider extends StatefulWidget {
  const EnergySlider({super.key});

  @override
  State<EnergySlider> createState() => _EnergySliderState();
}

class _EnergySliderState extends State<EnergySlider> {
  double _energy = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Quanta energia tens?'),
        Slider(
          value: _energy,
          min: 0,
          max: 10,
          divisions: 10,
          label: _energy.round().toString(),
          onChanged: (value) => setState(() => _energy = value),
        ),
      ],
    );
  }
}