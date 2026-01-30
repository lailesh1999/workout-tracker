import 'package:flutter_riverpod/legacy.dart';
import 'package:workout_tracker/ui/work_streak/provider/workout_streak_state.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/repository/repository.dart';

class WorkoutStreakNotifier extends StateNotifier<WorkoutStreakState> {
  WorkoutStreakNotifier() : super(const WorkoutStreakState());

  final AppRepository repository = serviceLocator<AppRepository>();

  Future<void> fetchWorkoutStreak() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final result = await repository.getWorkoutStreak();

      if (result.error != null) {
        state = state.copyWith(isLoading: false, error: result.error);
      } else {
        state = state.copyWith(isLoading: false, data: result);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }


}

final workoutStreakProvider =
StateNotifierProvider<WorkoutStreakNotifier, WorkoutStreakState>(
      (ref) => WorkoutStreakNotifier(),
);

