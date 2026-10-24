import 'package:dio/dio.dart';
import 'package:hungery/core/network/api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    if (data is  Map<String, dynamic> && data.containsKey('message')) {
      return ApiError(message: data['message'], statusCode: statusCode);
    }
    if ( statusCode == 302){
      return ApiError(message: "This email is already registered", statusCode: statusCode);
    }

    switch (error.type) {
      case DioExceptionType.cancel:
        return ApiError(message: "Request to API server was cancelled");

      case DioExceptionType.connectionTimeout:
        return ApiError(message: "Connection timeout with API server");

      case DioExceptionType.receiveTimeout:
        return ApiError(message: "Receive timeout in connection with API server");

      case DioExceptionType.sendTimeout:
        return ApiError(message: "Send timeout in connection with API server");

      case DioExceptionType.connectionError:
        return ApiError(
          message: "Connection to API server failed due to internet connection",
        );

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data?['message']
            ?? error.message
            ?? "Received invalid status code: $statusCode";
        return ApiError(
          message: message,
          statusCode: statusCode,
        );

      default:
        return ApiError(message: "Something went wrong");
    }
  }
}
