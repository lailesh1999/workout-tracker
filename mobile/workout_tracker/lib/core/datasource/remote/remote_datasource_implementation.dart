import 'package:workout_tracker/core/datasource/remote/remote_datasource.dart';

import '../../http_client/dio_client.dart';

class RemoteDatasourceImpl implements RemoteDatasource {

  DioClient dioInstance;

  RemoteDatasourceImpl({required this.dioInstance});

}