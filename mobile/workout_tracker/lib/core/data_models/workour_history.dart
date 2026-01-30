class WorkoutHistory {
  String? title;
  String? difficulty;
  int? durationMinutes;
  DateTime? date;
  String? error;

  WorkoutHistory({
    this.title,
    this.difficulty,
    this.durationMinutes,
    this.date,
    this.error,
  });

  factory WorkoutHistory.fromJson(Map<String, dynamic> json) {
    return WorkoutHistory(
      title: json['title'],
      difficulty: json['difficulty'],
      durationMinutes: json['durationMinutes'],
      date: json['date'] != null
          ? DateTime.tryParse(json['date'])
          : null,
    );
  }

  factory WorkoutHistory.withError(String message) {
    return WorkoutHistory(error: message);
  }
}
