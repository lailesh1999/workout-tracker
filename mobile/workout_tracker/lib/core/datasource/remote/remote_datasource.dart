import '../../data_models/complete_workout_response.dart';
import '../../data_models/workour_history.dart';
import '../../data_models/workout.dart';
import '../../data_models/worout_streak.dart';

abstract class RemoteDatasource {
  Future<List<Workout>> fetchWorkouts();

  Future<List<WorkoutHistory>> getWorkOutHistory();

  Future<WorkoutStreak> getWorkoutStreak();

  Future<CompleteWorkoutResponse> completeWorkout({
    required DateTime completedAt,
  });
}
