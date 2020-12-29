import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void Handletap(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final pages = [
      Page(
        width: width,
        height: height,
        color: Colors.green,
        title: 'home',
      ),
      Page(
        width: width,
        height: height,
        title: 'profile',
        color: Colors.red,
      ),
      Page(
        width: width,
        height: height,
        color: Colors.blue,
        title: 'settings',
      ),
    ];
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: pages[_selectedIndex].color,
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: pages[_selectedIndex].color,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text('profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('settings'),
          ),
        ],
        unselectedItemColor: Colors.cyanAccent.withOpacity(0.6),
        selectedItemColor: Colors.white,
        onTap: Handletap,
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({
    Key key,
    @required this.width,
    @required this.height,
    @required this.title,
    @required this.color,
  }) : super(key: key);

  final double width;
  final Color color;
  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color.withOpacity(0.3),
      child: Center(
        child: CircleAvatar(
          radius: 150,
          backgroundColor: color.withRed(100).withOpacity(0.5),
          child: Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}

