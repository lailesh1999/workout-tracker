import 'package:workout_tracker/core/data_models/workour_history.dart';

import '../data_models/workout.dart';

abstract class AppRepository {
  Future<List<Workout>> getWorkouts();

  Future<List<WorkoutHistory>> getWorkOutHistory();
}