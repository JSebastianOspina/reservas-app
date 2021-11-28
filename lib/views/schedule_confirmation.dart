import 'package:flutter/material.dart';

class ScheduleConfirmataionScreen extends StatelessWidget {
  const ScheduleConfirmataionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/confirmation.png'),
              Text(
                'Cita confirmada!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Has realizado exitosamente una cita para',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                  children: [
                    TextSpan(
                      text: ' corte de cabello',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' con ',
                    ),
                    TextSpan(
                      text: 'Sara Valentina Cuy',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' el ',
                    ),
                    TextSpan(
                      text: '17 de diciembre, 2021 a las 2:00pm ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder?>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                          const EdgeInsets.all(15)),
                      backgroundColor:
                          MaterialStateProperty.all<Color?>(Colors.black)),
                  onPressed: () => {Navigator.pushNamed(context, 'homeScreen')},
                  child: const Text(
                    'Volver al inicio',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
