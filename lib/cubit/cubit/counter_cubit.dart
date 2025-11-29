import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit({required int initialCount}) : super(const CounterInitial());

  void increment() {
    emit(CounterIncremented(state.count + 1));
  }

  void decrement() {
    if (state.count > 1) {
      emit(CounterDecremented(state.count - 1));
    }
  }

  void reset() {
    emit(const CounterInitial());
  }
}
