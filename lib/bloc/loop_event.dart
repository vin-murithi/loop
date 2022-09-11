part of 'loop_bloc.dart';

abstract class LoopEvent extends Equatable {
  const LoopEvent();

  @override
  List<Object> get props => [];
}

//A class to represent the Increment event
class IncrementCounter extends LoopEvent {
  final int value;
  const IncrementCounter({required this.value});

  @override
  List<Object> get props => [value];
}

class DecrementCounter extends LoopEvent {
  final int value;
  const DecrementCounter({required this.value});

  @override
  List<Object> get props => [];
}
