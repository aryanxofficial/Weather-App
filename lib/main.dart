import 'package:flutter/material.dart';
import 'package:weather_app/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),//.copyWith function can be used to overwrite any particular property I want to change keeping the rest of the theme same
      debugShowCheckedModeBanner: false,
      home: const WeatherScreen(),
    );
  }
}
