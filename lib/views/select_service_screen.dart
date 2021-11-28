import 'package:flutter/material.dart';

class SelectServiceScreen extends StatelessWidget {
  const SelectServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '¿Con quien quieres tu cita?',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.indigo),
            ),
            const SizedBox(
              height: 25,
            ),
            _ServiceCard(
              name: 'Sara Ramirez',
              shortDescription: 'Experta en tintes',
              stars: '4.8',
              backgroundColor: Colors.amber.shade50,
              assetPath: 'assets/women1.png',
            ),
            const SizedBox(
              height: 25,
            ),
            _ServiceCard(
              name: 'Valentina Cuy',
              shortDescription: 'Experta en pestañas',
              stars: '4.9',
              backgroundColor: Colors.blue.shade50,
              assetPath: 'assets/women3.png',
            ),
            const SizedBox(
              height: 25,
            ),
            _ServiceCard(
              name: 'Liliana Velasquez',
              shortDescription: 'Asesoría personalizada',
              stars: '5.0',
              backgroundColor: Colors.amber.shade50,
              assetPath: 'assets/women4.png',
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({
    Key? key,
    required this.name,
    required this.shortDescription,
    required this.stars,
    required this.backgroundColor,
    required this.assetPath,
  }) : super(key: key);

  final String name;
  final String shortDescription;
  final String stars;
  final Color backgroundColor;
  final String assetPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: backgroundColor),
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  shortDescription,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.indigo),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.indigo,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      stars,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.indigo),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                      const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder?>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    backgroundColor: MaterialStateProperty.all<Color?>(
                      Colors.indigo,
                    ),
                  ),
                  onPressed: () =>
                      {Navigator.pushNamed(context, 'newScheduleScreen')},
                  child: const Text(
                    'Agendar cita',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: Image.asset(
              assetPath,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
