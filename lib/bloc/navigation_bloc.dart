import 'package:flutter/material.dart';
import 'package:nav_bloc_test/main.dart' show Page;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../page_widget.dart';

enum navigationEvents {
  navHome,
  navSettings,
  navProfile,
}

class NavigationBloc extends Bloc<navigationEvents, Widget> {
  static var pages = const [
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
  NavigationBloc(Widget initialState) : super(pages[0]);

  @override
  Stream<Widget> mapEventToState(navigationEvents event) async* {
    if (event == navigationEvents.navHome) {
      yield pages[0];
    }
    if (event == navigationEvents.navProfile) {
      yield pages[1];
    }
    if (event == navigationEvents.navSettings) {
      yield pages[2];
    }
    throw UnimplementedError();
  }
}
