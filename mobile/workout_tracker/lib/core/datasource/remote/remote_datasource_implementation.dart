import 'package:dio/dio.dart';
import 'package:workout_tracker/core/data_models/workour_history.dart';
import 'package:workout_tracker/core/data_models/workout.dart';
import 'package:workout_tracker/core/datasource/remote/remote_datasource.dart';

import '../../const/constants.dart';
import '../../data_models/worout_streak.dart';
import '../../http_client/dio_client.dart';

class RemoteDatasourceImpl implements RemoteDatasource {
  DioClient dioInstance;

  RemoteDatasourceImpl({required this.dioInstance});

  @override
  Future<List<Workout>> fetchWorkouts() async {
    try {
      final response = await dioInstance.dioInstance!.get(
        "${dioInstance.baseUrl}${Constants.getWorkOuts}",
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List data = response.data;

        return data.map((json) => Workout.fromJson(json)).toList();
      } else {
        return [
          Workout.withError(
            dioInstance.handleStatusCodeError(response.statusCode),
          ),
        ];
      }
    } catch (e) {
      return [Workout.withError(e.toString())];
    }
  }

  @override
  Future<List<WorkoutHistory>> getWorkOutHistory() async {
    try {
      final response = await dioInstance.dioInstance!.get(
        "${dioInstance.baseUrl}${Constants.getWorkOutsHistory}",
      );

      final List<dynamic> data = response.data as List<dynamic>;

      return data.map((json) => WorkoutHistory.fromJson(json)).toList();
    } on DioException catch (e) {
      return [
        WorkoutHistory.withError(
          dioInstance.handleStatusCodeError(e.response?.statusCode),
        ),
      ];
    } catch (e) {
      return [WorkoutHistory.withError(e.toString())];
    }
  }
  Future<WorkoutStreak> getWorkoutStreak() async {
    try {
      final response = await dioInstance.dioInstance!.get(
        "${dioInstance.baseUrl}${Constants.getWorkoutStreak}",
      );

      return WorkoutStreak.fromJson(response.data);
    } on DioException catch (e) {
      return WorkoutStreak.withError(
        dioInstance.handleStatusCodeError(
          e.response?.statusCode,
        ),
      );
    } catch (e) {
      return WorkoutStreak.withError(e.toString());
    }
  }

}
