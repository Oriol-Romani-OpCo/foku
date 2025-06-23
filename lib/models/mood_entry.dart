class MoodEntry {
  final String id;
  final DateTime timestamp;
  final int mood; // 0-4
  final int energy; // 0-10
  MoodEntry({required this.id, required this.timestamp, required this.mood, required this.energy});
}