import 'package:belajar_api/sreen/contact/contact_screen.dart';
import 'package:belajar_api/sreen/contact/contact_view_model.dart';
import 'package:belajar_api/sreen/dice_bear/dice_bear_screen.dart';
import 'package:belajar_api/sreen/dice_bear/dice_bear_view_model.dart';
import 'package:belajar_api/sreen/login/login_screen.dart';
import 'package:belajar_api/sreen/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String urlLogin = "";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ContactViewModel>(
          create: (context) => ContactViewModel(),
        ),
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider<DiceBearViewModel>(
          create: (context) => DiceBearViewModel(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DiceBearScreen(),
      ),
    );
  }
}
