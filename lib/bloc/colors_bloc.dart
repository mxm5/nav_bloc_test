import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum colorsEvent { red, blue, green, purple }

class ColorsBloc extends Bloc<colorsEvent, Color> {
  ColorsBloc() : super(Colors.green);

  @override
  Stream<Color> mapEventToState(colorsEvent event) async* {
    if (event == colorsEvent.blue) {
      yield Colors.blue;
    }
    if (event == colorsEvent.red) {
      yield Colors.red;
    }
    if (event == colorsEvent.green) {
      yield Colors.green;
    }
    if (event == colorsEvent.purple) {
      yield Colors.purple;
    }
    throw UnimplementedError();
  }
}
