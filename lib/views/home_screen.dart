// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var cardHeight = size.height / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.menu,
            size: 32,
          ),
          foregroundColor: Colors.black),
      body: HomeBody(size: size, cardHeight: cardHeight),
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: HomeBottomNavigationBar(),
    );
  }
}

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconSize: 26,
        fixedColor: Colors.indigo,
        currentIndex: _selectedIndex,
        onTap: (int tapIndex) {
          setState(() {
            _selectedIndex = tapIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.other_houses_outlined),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Descubrir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Mis citas',
          )
        ]);
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    required this.size,
    required this.cardHeight,
  }) : super(key: key);

  final Size size;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Column(
        children: [
          const SizedBox(
            height: 15.0,
          ),
          Text(
            'NORDICOS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              color: Colors.indigo[400],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15.0,
          ),
          HomeHeadingText(),
          SizedBox(
            height: 50,
          ),
          HomeSlider(cardHeight: cardHeight, size: size)
        ],
      ),
    );
  }
}

class HomeHeadingText extends StatelessWidget {
  const HomeHeadingText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Hola, Sara',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '¿Que te gustaría hacerte hoy?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            textAlign: TextAlign.start,
          ),
        ]);
  }
}

class HomeSlider extends StatelessWidget {
  const HomeSlider({
    Key? key,
    required this.cardHeight,
    required this.size,
  }) : super(key: key);

  final double cardHeight;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cardHeight,
      child: Swiper(
          scale: 0.95,
          viewportFraction: 0.9,
          itemCount: 4,
          itemBuilder: (_, i) {
            return Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12)),
              width: size.width,
              height: double.infinity,
              child: Column(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      'assets/$i.jpg',
                      fit: BoxFit.cover,
                      height: cardHeight / 2,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/1.png',
                          width: 45,
                          height: 45,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'Corte de cabello',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              'Incluye bebida de cortesia',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry?>(
                            EdgeInsets.symmetric(vertical: 18.0),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color?>(
                            Colors.indigo,
                          ),
                        ),
                        onPressed: () => {},
                        child: Text('Agendar cita',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            );
          }),
    );
  }
}
