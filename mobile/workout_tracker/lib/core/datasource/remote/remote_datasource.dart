import '../../data_models/workout.dart';

abstract class RemoteDatasource{


  Future<List<Workout>> fetchWorkouts();

}