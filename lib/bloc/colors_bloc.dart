import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum selectedColor { blue, red, green }

class MyColorsBloc extends Bloc<selectedColor, Color> {
  MyColorsBloc() : super(Colors.blue);

  @override
  Stream<Color> mapEventToState(selectedColor event) async* {
    if (event == selectedColor.blue) {
      yield Colors.blue;
    }
    if (event == selectedColor.green) {
      yield Colors.green;
    }
    if (event == selectedColor.red) {
      yield Colors.red;
    }
    throw UnimplementedError();
  }
}
