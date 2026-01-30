import 'package:flutter_riverpod/legacy.dart';

import '../../../core/di/service_locator.dart';
import '../../../core/repository/repository.dart';
import 'complete_workout_state.dart';

class CompleteWorkoutNotifier extends StateNotifier<CompleteWorkoutState> {
  CompleteWorkoutNotifier() : super(const CompleteWorkoutState());

  final AppRepository repository = serviceLocator<AppRepository>();

  Future<void> completeWorkout({
    required int? workoutId,
  }) async {
    state = state.copyWith(isLoading: true, error: null,loadingWorkoutId: workoutId,);

    final result = await repository.completeWorkout(
      completedAt: DateTime.now(),
    );

    if (result.error != null) {
      state = state.copyWith(isLoading: false, error: result.error,loadingWorkoutId: null,);
    } else {
      state = state.copyWith(isLoading: false, data: result,loadingWorkoutId: null,);
    }
  }
}

final completeWorkoutProvider =
    StateNotifierProvider<CompleteWorkoutNotifier, CompleteWorkoutState>(
      (ref) => CompleteWorkoutNotifier(),
    );
