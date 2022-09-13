import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loop/bloc/loop_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final LoopBloc loopBloc = BlocProvider.of<LoopBloc>(context);
    return BlocBuilder<LoopBloc, CounterState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'My Number is:',
              ),
              Text(
                '${state.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      loopBloc.add(const DecrementCounter(value: 1));
                    },
                    child: const Text('-'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      loopBloc.add(const IncrementCounter(value: 1));
                    },
                    child: const Text('+'),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
// This trailing comma makes auto-formatting nicer for build methods.
  }
}
