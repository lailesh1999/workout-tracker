import 'package:flutter_riverpod/legacy.dart';
import 'package:workout_tracker/core/datasource/dummy_database/dummy_data_workouts.dart';
import 'package:workout_tracker/ui/WorkoutList/provider/workout_state.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/repository/repository.dart';

class WorkoutNotifier extends StateNotifier<WorkoutState> {
  WorkoutNotifier() : super(const WorkoutState());

  final AppRepository repository = serviceLocator<AppRepository>();

  Future<void> fetchWorkouts() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final data = await repository.getWorkouts();
      state = state.copyWith(
        isLoading: false,
        workouts: data,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

final workoutProvider =
StateNotifierProvider<WorkoutNotifier, WorkoutState>(
      (ref) => WorkoutNotifier(),
);
