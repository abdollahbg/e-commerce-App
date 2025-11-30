import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  final int count;

  const CounterState(this.count);

  @override
  List<Object> get props => [count];
}

class CounterInitial extends CounterState {
  const CounterInitial() : super(1);
}

class CounterIncremented extends CounterState {
  const CounterIncremented(super.newCount);
}

class CounterDecremented extends CounterState {
  const CounterDecremented(super.newCount);
}
