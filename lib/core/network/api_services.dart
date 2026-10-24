import 'package:dio/dio.dart';
import 'package:hungery/core/network/api_exceptions.dart';
import 'package:hungery/core/network/dio_client.dart';

class ApiServices {
  final DioClient _dioClient = DioClient();

  //get
  Future<dynamic> get(String endpoint) async {
    try {
      final response = await _dioClient.client.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  //post
  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dioClient.client.post(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  //put
  Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dioClient.client.put(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  //delete
  Future<dynamic> delete(String endpoint) async {
    try {
      final response = await _dioClient.client.delete(endpoint);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }
}
