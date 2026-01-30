class WorkoutStreak {
  int? streak;
  DateTime? lastWorkoutDate;
  String? error; // for error handling

  WorkoutStreak({
    this.streak,
    this.lastWorkoutDate,
    this.error,
  });

  factory WorkoutStreak.fromJson(Map<String, dynamic> json) {
    return WorkoutStreak(
      streak: json['streak'],
      lastWorkoutDate: json['lastWorkoutDate'] != null
          ? DateTime.tryParse(json['lastWorkoutDate'])
          : null,
    );
  }

  factory WorkoutStreak.withError(String message) {
    return WorkoutStreak(error: message);
  }
}
