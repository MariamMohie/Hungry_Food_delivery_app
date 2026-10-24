import 'package:dio/dio.dart';
import 'package:hungery/core/utils/pref_helpers.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://sonic-zdi0.onrender.com/api',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  DioClient() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelpers.getToken();

          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
      ),
    );
  }
  Dio get client => dio;
}
