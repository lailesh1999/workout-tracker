import 'package:workout_tracker/core/data_models/workout.dart';
import 'package:workout_tracker/core/datasource/remote/remote_datasource.dart';

import '../../const/constants.dart';
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

        return data
            .map((json) => Workout.fromJson(json))
            .toList();
      } else {
        return [
          Workout.withError(
            dioInstance.handleStatusCodeError(response.statusCode),
          )
        ];
      }
    } catch (e) {
      return [Workout.withError(e.toString())];
    }
  }

}