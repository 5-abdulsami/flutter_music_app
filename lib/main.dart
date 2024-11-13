import 'package:flutter/material.dart';
import 'package:flutter_music_app/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Music App',
        theme: ThemeData(
            appBarTheme:
                AppBarTheme(backgroundColor: Colors.transparent, elevation: 0)),
        home: const HomeScreen());
  }
}