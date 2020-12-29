import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nav_bloc_test/bloc/colors_bloc.dart';
import 'package:nav_bloc_test/bloc/counter_bloc.dart';
import 'package:nav_bloc_test/bloc/navigation_bloc.dart';

import 'page_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ColorsBloc>(
      create: (context) => ColorsBloc(),
      child: BlocBuilder<ColorsBloc, Color>(
        builder: (context, color) {
          return MaterialApp(
            // debugShowMaterialGrid: true,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: color,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),

            home: BlocProvider<CounterBloc>(
              create: (context) => CounterBloc(),
              child: BlocProvider<NavigationBloc>(
                  create: (context) => NavigationBloc(),
                  child: MyHomePage(title: 'Flutter Demo Home Page')),
            ),
          );
        },
      ),
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
      MyPage(
        color: Colors.purple,
        title: 'counter Page',
      ),
    ];
    //
    // BlocProvider<NavigationBloc>(
    return BlocBuilder<ColorsBloc, Color>(
      builder: (context, dcolor) {
        return BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return BlocBuilder<NavigationBloc, MyPage>(
              builder: (context, widget) {
                return Scaffold(
                  appBar: AppBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '${widget.title}',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40,
                              fontStyle: FontStyle.italic),
                        ),
                        Text(
                          '$state',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 60,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    backgroundColor: dcolor,
                  ),
                  body: widget,
                  bottomNavigationBar: BottomNavigationBar(
                    backgroundColor: Colors.red,
                    currentIndex: _selectedIndex,
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          title: Text('home'),
                          backgroundColor: dcolor),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.account_balance_wallet),
                          title: Text('profile'),
                          backgroundColor: dcolor),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.settings),
                          title: Text('settings'),
                          backgroundColor: dcolor),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.add),
                          title: Text('counter'),
                          backgroundColor: dcolor),
                    ],
                    unselectedItemColor: Colors.cyanAccent.withOpacity(0.6),
                    selectedItemColor: Colors.white,
                    onTap: (i) {
                      setState(() {
                        _selectedIndex = i;
                      });
                      if (i == 0) {
                        context
                            .bloc<NavigationBloc>()
                            .add(navigationEvents.navHome);
                        context.bloc<ColorsBloc>().add(colorsEvent.green);
                      }
                      if (i == 1) {
                        context.bloc<ColorsBloc>().add(colorsEvent.red);
                        context
                            .bloc<NavigationBloc>()
                            .add(navigationEvents.navProfile);
                      }
                      if (i == 2) {
                        context.bloc<ColorsBloc>().add(colorsEvent.blue);
                        context
                            .bloc<NavigationBloc>()
                            .add(navigationEvents.navSettings);
                      }
                      if (i == 3) {
                        context.bloc<ColorsBloc>().add(colorsEvent.purple);
                        context
                            .bloc<NavigationBloc>()
                            .add(navigationEvents.navCounter);
                      }
                    },
                  ),
                  floatingActionButton: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          ' $state',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 70),
                        ),
                        color: dcolor,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          context
                              .bloc<CounterBloc>()
                              .add(counterEvents.increment);
                        },
                        child: Icon(Icons.add),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          context
                              .bloc<CounterBloc>()
                              .add(counterEvents.decrement);
                        },
                        child: Icon(Icons.remove),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
