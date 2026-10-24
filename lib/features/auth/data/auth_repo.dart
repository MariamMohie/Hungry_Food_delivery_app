import 'package:dio/dio.dart';
import 'package:hungery/core/constants/api_endpoints.dart';
import 'package:hungery/core/network/api_error.dart';
import 'package:hungery/core/network/api_exceptions.dart';
import 'package:hungery/core/network/api_services.dart';
import 'package:hungery/core/utils/pref_helpers.dart';
import 'package:hungery/features/auth/data/auth_model.dart';

class AuthRepo {
  ApiServices apiServices = ApiServices();

  // login user
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await apiServices.post(ApiEndpoints.login, {
        'email': email,
        'password': password,
      });
      if (response is ApiError) {
        throw response;
      }
      if (response is Map<String, dynamic>) {
        {
          final msg = response['message'];
          final code = response['code'];
          final data = response['data'];

          if (code != 200 && code != 201) {
            throw ApiError(message: msg ?? 'Login failed');
          }
        }

        final user = UserModel.fromJson(response['data']);
        if (user.token != null) {
          // Save token to shared preferences
          await PrefHelpers.saveToken(user.token!);
        }
        return user;
      } else {
        throw ApiError(message: 'Unexpected error from server');
      }
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }


  //  SignUp user
  Future<UserModel>  signUp(
      String name, String email, String password) async {
    try {
      final response = await apiServices.post(ApiEndpoints.signUp, {
        'name': name,
        'email': email,
        'password': password,
      });
      if (response is ApiError) {
        throw response;
      }
      if (response is Map<String, dynamic>) {
        {
          final msg = response['message'];
          final code = response['code'];
          final data = response['data'];
          final coder = int.tryParse(code);

          if (coder != 200 && coder != 201) {
            throw ApiError(message: msg ?? 'Registration failed');
          }

        }

        final user = UserModel.fromJson(response['data']);
        if (user.token != null) {
          // Save token to shared preferences
          await PrefHelpers.saveToken(user.token!);
        }
        return user;
      } else {
        throw ApiError(message: 'Unexpected error from server');
      }
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
