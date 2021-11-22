import 'package:flutter/material.dart';
import 'package:reservas_app/views/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'homeScreen',
      routes: {
        'homeScreen': (_) => const HomeScreen(),
      },
    );
  }
}
