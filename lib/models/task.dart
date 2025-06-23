class Task {
  final String id;
  final String title;
  final int difficulty; // 1-3
  Task({required this.id, required this.title, this.difficulty = 1});
}