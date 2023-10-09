import 'package:belajar_api/screen/contact/contact_screen.dart';
import 'package:belajar_api/screen/contact/contact_view_model.dart';
import 'package:belajar_api/screen/dice_bear/dice_bear_screen.dart';
import 'package:belajar_api/screen/dice_bear/dice_bear_view_model.dart';
import 'package:belajar_api/screen/login/login_screen.dart';
import 'package:belajar_api/screen/login/login_view_model.dart';
import 'package:belajar_api/screen/movie/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:belajar_api/screen/movie/movie_view_model.dart';
import 'package:belajar_api/screen/movie/search_movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        BlocProvider<MovieDetailBloc>(
          create: (context) => MovieDetailBloc(),
        )
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ContactViewModel>(
            create: (context) => ContactViewModel(),
          ),
          ChangeNotifierProvider<LoginViewModel>(
            create: (context) => LoginViewModel(),
          ),
          ChangeNotifierProvider<DiceBearViewModel>(
            create: (context) => DiceBearViewModel(),
          ),
          ChangeNotifierProvider<MovieViewModel>(
            create: (context) => MovieViewModel(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: SearchMovieScreen(),
        ),
      ),
    );
  }
}
