import '../../data_models/workour_history.dart';
import '../../data_models/workout.dart';

abstract class RemoteDatasource{


  Future<List<Workout>> fetchWorkouts();

  Future<List<WorkoutHistory>> getWorkOutHistory();

}