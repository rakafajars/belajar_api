import 'package:belajar_api/model/api/auth_api.dart';
import 'package:belajar_api/sreen/contact/contact_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLoadingLogin = false;

  bool get isLoadingLogin => _isLoadingLogin;

  final TextEditingController _usernameController = TextEditingController();
  TextEditingController get usernameController => _usernameController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  void postLogin(BuildContext context) async {
    _isLoadingLogin = true;
    notifyListeners();

    try {
      final data = await AuthApi.login(
        username: _usernameController.text,
        password: _passwordController.text,
      );

      final snackBar = SnackBar(
        content: Text("Anda Berhasil Login!"),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const ContactScreen(),
        ),
        (_) => false,
      );
    } on DioException catch (e) {
      final snackBar = SnackBar(
        content: Text(e.response?.data["message"] ?? "Terjadi Kesalaha!"),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // KONDISI KLO STATUS MESSAGE PERLU DI COSTUME
      // if (e.response?.statusCode == 400) {
      //   if (e.response?.data["message"] ==
      //       "Please provide phone number or username") {
      //     const snackBar = SnackBar(
      //       content: Text('Username & Password Tidak Boleh Kosong!'),
      //     );

      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //   }
      // } else if (e.response?.statusCode == 401) {
      //   if (e.response?.data["message"] == "User is not registered" ||
      //       e.response?.data["message"] == "Wrong password!") {
      //     const snackBar = SnackBar(
      //       content: Text('Username atau password salah!'),
      //     );

      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //   } else {
      //     const snackBar = SnackBar(
      //       content: Text('Koneksi Bermasalah'),
      //     );

      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //   }
      // } else {
      //   const snackBar = SnackBar(
      //     content: Text('Terjadi Kesalahan!'),
      //   );

      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // }
    } finally {
      _isLoadingLogin = false;
    }
    notifyListeners();
  }
}
