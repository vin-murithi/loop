import 'package:flutter/material.dart';
import 'package:loop/screens/counter/counter.dart';
import 'package:loop/screens/weather/weather_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navBarIndex = 0;
  List screens = [
    const WeatherPage(),
    const MyHomePage(),
    const Center(
      child: Text('Screen 3'),
    ),
    const Center(
      child: Text('Screen 4'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: screens[navBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navBarIndex,
        onTap: ((index) => setState(() {
              navBarIndex = index;
            })),
        iconSize: 25,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'Weather',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Entertainment',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
