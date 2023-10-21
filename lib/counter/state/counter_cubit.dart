import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(0));

  void increment() {
    emit(CounterState(state.counter + 1));
  }

  void decrement() {
    emit(CounterState(state.counter - 1));
  }
}
