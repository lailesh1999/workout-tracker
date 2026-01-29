import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
const _defaultConnectTimeout = 50000;
const _defaultReceiveTimeout = 50000;
class DioClient {
  final String? baseUrl;
  Dio? dioInstance;


  final List<Interceptor>? interceptors;

  DioClient({
    this.baseUrl,
    Dio? dio,
    this.interceptors,
  }) {
    dioInstance = dio ?? Dio();
    dioInstance!
      ..options.baseUrl = baseUrl!
      ..options.connectTimeout = const Duration( milliseconds: _defaultConnectTimeout)
      ..options.receiveTimeout =  const Duration( milliseconds: _defaultReceiveTimeout)
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};

    if (interceptors?.isNotEmpty ?? false) {
      dioInstance!.interceptors.addAll(interceptors!);
    }

    // dioInstance?.interceptors.add(P2pInterceptors());

    if (kDebugMode) {
      dioInstance!.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: true,
          requestBody: true
      ));
    }
    // Add interceptor for token refreshing
  }


  String handleError(DioException error) {
    String errorDescription = "";
    switch (error.type) {
      case DioExceptionType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioExceptionType.unknown:
        errorDescription =
        "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        errorDescription =
        "Received invalid status code: ${error.response!.statusCode}";
        if(error.response!.data != null ){
          try {
            // var apiResponse = ApiResponse.fromJson(dioError.response!.data);
            // if (apiResponse.msg != null) {
            //   errorDescription = apiResponse.msg!;
            // }
          }catch(exception){
            // debugPrint(exception.toString());
          }
        }
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioExceptionType.badCertificate:
        errorDescription = "Bad Certificate error!";
        break;
      case DioExceptionType.connectionError:
        errorDescription = "Connection Error with API server";
    }
    return errorDescription;
  }

  String handleStatusCodeError(int? statusCode) {
    String errorDescription = "Something went wrong!";
    if (statusCode != null) {
      if (statusCode >= 300 && statusCode < 400) {
        errorDescription = "API redirected";
      } else if (statusCode >= 400 && statusCode < 500) {
        errorDescription = "UnAuthorised!";
      } else if (statusCode >= 500) {
        errorDescription = "Internal Server Error!";
      }
    }
    return errorDescription;
  }
}