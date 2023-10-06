import 'package:belajar_api/sreen/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
          ),
        ),
        body: Consumer<LoginViewModel>(
          builder: (context, loginViewModel, child) {
            return Column(children: [
              TextField(
                controller: loginViewModel.usernameController,
              ),
              TextField(
                controller: loginViewModel.passwordController,
              ),
              loginViewModel.isLoadingLogin == true
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        loginViewModel.postLogin(context);
                      },
                      child: const Text(
                        'Login',
                      ),
                    )
            ]);
          },
        ));
  }
}
