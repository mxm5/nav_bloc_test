import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_bloc_test/bloc/navigation_bloc.dart';

import 'page_widget.dart';
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

      home: BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
          child: MyHomePage(title: 'Flutter Demo Home Page')),
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
    final pages = [
      MyPage(
        color: Colors.green,
        title: 'home',
      ),
      MyPage(
        title: 'profile',
        color: Colors.red,
      ),
      MyPage(
        color: Colors.blue,
        title: 'settings',
      ),
    ];
    //
    // BlocProvider<NavigationBloc>(
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: pages[_selectedIndex].color,
      ),
      body: BlocBuilder<NavigationBloc, Widget>(
        builder: (context, widget) {
          return widget;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
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
        onTap: (i) {
          if (i == 0) {
            context.bloc<NavigationBloc>().add(navigationEvents.navHome);
          }
          if (i == 1) {
            context.bloc<NavigationBloc>().add(navigationEvents.navProfile);
          }
          if (i == 2) {
            context.bloc<NavigationBloc>().add(navigationEvents.navSettings);
          }
        },
      ),
    );
  }
}
