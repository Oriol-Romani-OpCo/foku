import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/mood_entry.dart';

final moodProvider = StateNotifierProvider<MoodNotifier, MoodEntry?>((ref) => MoodNotifier());

class MoodNotifier extends StateNotifier<MoodEntry?> {
  MoodNotifier(): super(null);
  void setMood(MoodEntry entry) => state = entry;
}