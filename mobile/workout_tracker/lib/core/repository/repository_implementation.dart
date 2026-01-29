import 'package:workout_tracker/core/repository/repository.dart';

import '../datasource/local/local_datasource.dart';
import '../datasource/remote/remote_datasource.dart';

class RepositoryImpl implements AppRepository {
  RemoteDatasource remoteDatasource;
  LocalDatasource localDateSource;

  RepositoryImpl(
      {required this.remoteDatasource, required this.localDateSource});


}