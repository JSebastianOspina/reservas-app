// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: HomeBottomNavigationBar(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const greyBackgroundTextField(),
              SizedBox(
                height: 25,
              ),
              Text(
                'Servicios destacados',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Slider(size: size),
              SizedBox(
                height: 25,
              ),
              Text(
                'Todos los servicios',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: _AllServicesVerticalSlider(size: size),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AllServicesVerticalSlider extends StatelessWidget {
  const _AllServicesVerticalSlider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //padding: EdgeInsets.all(10),
      itemCount: 4,
      itemBuilder: (_, int i) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('selectServiceScreen');
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 1,
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset(2, 2),
                ),
              ],
            ),
            height: 120,
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/$i.jpg',
                    width: size.width / 3.5,
                    height: size.width / 3.5,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Corte de barba',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(
                      'Realizado por expertos',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Icon(Icons.favorite)
              ],
            ),
          ),
        );
      },
    );
  }
}

class Slider extends StatelessWidget {
  const Slider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('selectServiceScreen');
              },
              child: Container(
                margin: EdgeInsets.only(right: 15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(17)),
                  image: DecorationImage(
                      image: AssetImage('assets/$i.jpg'), fit: BoxFit.cover),
                ),
                width: size.width * 0.65,
                height: 170,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Corte de cabello',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            );
          },
          itemCount: 3),
    );
  }
}

class greyBackgroundTextField extends StatelessWidget {
  const greyBackgroundTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(color: Colors.grey[600]),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(1),
          prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade200,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          hintText: 'Buscar',
          filled: true,
          fillColor: Colors.grey[100],
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade100, width: 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ));
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
