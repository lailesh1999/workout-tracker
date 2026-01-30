class CompleteWorkoutResponse {
  String? message;
  int? streak;
  String? error;

  CompleteWorkoutResponse({
    this.message,
    this.streak,
    this.error,
  });

  factory CompleteWorkoutResponse.fromJson(
      Map<String, dynamic> json) {
    return CompleteWorkoutResponse(
      message: json['message'],
      streak: json['streak'],
    );
  }

  factory CompleteWorkoutResponse.withError(String message) {
    return CompleteWorkoutResponse(error: message);
  }
}
