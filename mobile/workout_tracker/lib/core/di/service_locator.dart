import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_tracker/core/const/constants.dart';
import 'package:workout_tracker/core/datasource/local/local_datasource.dart';

import '../datasource/local/local_datasource_implementation.dart';
import '../datasource/remote/remote_datasource.dart';
import '../datasource/remote/remote_datasource_implementation.dart';
import '../http_client/dio_client.dart';
import '../http_client/interceptor.dart';
import '../repository/repository.dart';
import '../repository/repository_implementation.dart';


/*
This file is used for dependency injection.
The get_it package is used as a service locator.
Once an instance is registered, it can be accessed anywhere in the application.
There is no need to create the instance again and again.
 */

GetIt serviceLocator = GetIt.instance;

Future<void> setUpServiceLocator() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  serviceLocator.registerSingleton<SharedPreferences>(sharedPreferences);

  serviceLocator.registerLazySingleton<DioClient>(
    () => DioClient(
      baseUrl: Constants.baseUrl,
      dio: Dio(),
      interceptors: [RetryInterceptor(Dio())],
    ),
  );

  serviceLocator.registerLazySingleton<RemoteDatasource>(
    () => RemoteDatasourceImpl(dioInstance: serviceLocator<DioClient>()),
  );
  serviceLocator.registerLazySingleton<LocalDatasource>(
    () => LocalDatasourceImpl(serviceLocator<SharedPreferences>()),
  );

  serviceLocator.registerLazySingleton<AppRepository>(
    () => RepositoryImpl(
      remoteDatasource: serviceLocator<RemoteDatasource>(),
      localDateSource: serviceLocator<LocalDatasource>(),
    ),
  );
}
