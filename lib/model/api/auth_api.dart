import 'package:belajar_api/main.dart';
import 'package:belajar_api/model/login_model.dart';
import 'package:dio/dio.dart';

class AuthApi {
  static Future<LoginModel> login({
    required String username,
    required String password,
  }) async {
    final response = await Dio().post(
      "$urlLogin/auth/signIn",
      data: {
        "username": username,
        "password": password,
      },
    );

    return LoginModel.fromJson(response.data);
  }
}
