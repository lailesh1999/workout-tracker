import 'package:flutter_riverpod/legacy.dart';
import 'package:workout_tracker/core/datasource/dummy_database/dummy_work_history.dart';
import 'package:workout_tracker/ui/workout_history/provider/workout_history_state.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/repository/repository.dart';

class WorkoutHistoryNotifier extends StateNotifier<WorkoutHistoryState> {
  WorkoutHistoryNotifier() : super(const WorkoutHistoryState());

  final AppRepository repository = serviceLocator<AppRepository>();

  Future<void> fetchWorkouts() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final data = await repository.getWorkOutHistory();
      state = state.copyWith(
        isLoading: false,
        workoutHistory: data,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

final workoutHistoryProvider =
StateNotifierProvider<WorkoutHistoryNotifier, WorkoutHistoryState>(
      (ref) => WorkoutHistoryNotifier(),
);
