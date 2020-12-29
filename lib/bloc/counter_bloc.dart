import 'package:flutter_bloc/flutter_bloc.dart';

enum counterEvents { increment, decrement }

class CounterBloc extends Bloc<counterEvents, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(counterEvents event) async* {
    if (event == counterEvents.increment) {
      yield state + 1;
    }
    if (event == counterEvents.decrement) {
      yield state - 1;
    }

    throw UnimplementedError();
  }
}
