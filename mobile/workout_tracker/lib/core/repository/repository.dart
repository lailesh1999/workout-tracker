import '../data_models/workout.dart';

abstract class AppRepository {
  Future<List<Workout>> getWorkouts();
}