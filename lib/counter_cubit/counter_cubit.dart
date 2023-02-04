import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));

  void incrementCounter() {
    final newValue = state.count;

    emit(CounterState(newValue + 1));
  }
}
