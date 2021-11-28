import 'package:flutter/material.dart';
import 'package:reservas_app/views/home_screen.dart';
import 'package:reservas_app/views/new_schedule_screen.dart';
import 'package:reservas_app/views/schedule_confirmation.dart';
import 'package:reservas_app/views/select_service_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'scheduleConfirmationScreen',
      routes: {
        'homeScreen': (_) => const HomeScreen(),
        'selectServiceScreen': (_) => const SelectServiceScreen(),
        'newScheduleScreen': (_) => const NewScheduleScreen(),
        'scheduleConfirmationScreen': (_) => const ScheduleConfirmataionScreen()
      },
    );
  }
}
