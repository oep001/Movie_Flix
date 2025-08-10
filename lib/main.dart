import 'package:flutter/material.dart';
import 'package:movie_flix/Movies/movie_data.dart';
import 'package:movie_flix/Screens/detail_screen.dart';
import 'package:movie_flix/Screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) { return HomeScreen(); },
        '/detail': (BuildContext context) { return DetailScreen(); }
      }
    );
  }
}
