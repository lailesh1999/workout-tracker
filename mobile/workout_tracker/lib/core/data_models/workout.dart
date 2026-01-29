class Workout {
  int? id;
  String? title;
  String? description;
  int? durationMinutes;
  String? difficulty;
  String? error; // for error handling

  Workout({
    this.id,
    this.title,
    this.description,
    this.durationMinutes,
    this.difficulty,
    this.error,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      durationMinutes: json['duration_minutes'],
      difficulty: json['difficulty'],
    );
  }

  factory Workout.withError(String message) {
    return Workout(error: message);
  }
}
