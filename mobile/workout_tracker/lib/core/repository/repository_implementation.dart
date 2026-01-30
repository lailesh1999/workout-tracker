import 'package:workout_tracker/core/data_models/workour_history.dart';
import 'package:workout_tracker/core/data_models/workout.dart';
import 'package:workout_tracker/core/repository/repository.dart';

import '../datasource/local/local_datasource.dart';
import '../datasource/remote/remote_datasource.dart';

class RepositoryImpl implements AppRepository {
  RemoteDatasource remoteDatasource;
  LocalDatasource localDateSource;

  RepositoryImpl(
      {required this.remoteDatasource, required this.localDateSource});

  @override
  Future<List<Workout>> getWorkouts() {
    return remoteDatasource.fetchWorkouts();
  }

  @override
  Future<List<WorkoutHistory>> getWorkOutHistory() {
    return remoteDatasource.getWorkOutHistory();
  }


}