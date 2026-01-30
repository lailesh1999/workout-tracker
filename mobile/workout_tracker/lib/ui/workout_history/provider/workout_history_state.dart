import 'package:workout_tracker/core/data_models/workour_history.dart';

class WorkoutHistoryState {
  final bool isLoading;
  final List<WorkoutHistory>? workoutHistory;
  final String? error;

  const WorkoutHistoryState({
    this.isLoading = false,
    this.workoutHistory,
    this.error,
  });

  WorkoutHistoryState copyWith({
    bool? isLoading,
    List<WorkoutHistory>? workoutHistory,
    String? error,
  }) {
    return WorkoutHistoryState(
      isLoading: isLoading ?? this.isLoading,
      workoutHistory: workoutHistory ?? this.workoutHistory,
      error: error,
    );
  }
}
