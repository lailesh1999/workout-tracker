import '../../../core/data_models/workout.dart';

class WorkoutState {
  final bool isLoading;
  final List<Workout>? workouts;
  final String? error;

  const WorkoutState({
    this.isLoading = false,
    this.workouts,
    this.error,
  });

  WorkoutState copyWith({
    bool? isLoading,
    List<Workout>? workouts,
    String? error,
  }) {
    return WorkoutState(
      isLoading: isLoading ?? this.isLoading,
      workouts: workouts ?? this.workouts,
      error: error,
    );
  }
}
