import '../../../core/data_models/worout_streak.dart';

class WorkoutStreakState {
  final bool isLoading;
  final WorkoutStreak? data;
  final String? error;

  const WorkoutStreakState({this.isLoading = false, this.data, this.error});

  WorkoutStreakState copyWith({
    bool? isLoading,
    WorkoutStreak? data,
    String? error,
  }) {
    return WorkoutStreakState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error,
    );
  }
}
