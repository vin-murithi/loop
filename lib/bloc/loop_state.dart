part of 'loop_bloc.dart';

// abstract class LoopState extends Equatable {
//   const LoopState();

//   @override
//   List<Object> get props => [];
// }

//A class to represent the state of the counter
class CounterState extends Equatable {
  final int counter;
  const CounterState({required this.counter});
  @override
  List<Object> get props => [counter];
}
