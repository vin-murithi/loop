import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loop_event.dart';
part 'loop_state.dart';

class LoopBloc extends Bloc<LoopEvent, CounterState> {
  LoopBloc() : super(const CounterState(counter: 69)) {
    //Register event and callback to handle it
    on<IncrementCounter>(_incrementCounter);
    on<DecrementCounter>(_decrementCounter);
  }

//Define callback method with inputter(event type) and emitter(state)
  void _incrementCounter(IncrementCounter event, Emitter<CounterState> emit) {
    //Emit a state everytime the method is invoked
    emit(
      CounterState(counter: state.counter + event.value),
    );
  }

  void _decrementCounter(DecrementCounter event, Emitter<CounterState> emit) {
    emit(
      CounterState(counter: state.counter - event.value),
    );
  }
}
