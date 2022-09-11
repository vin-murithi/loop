import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loop/bloc/loop_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final LoopBloc loopBloc = BlocProvider.of<LoopBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: BlocBuilder<LoopBloc, CounterState>(
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
      ),

      //Wrap container with block listener to detect user inputs
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          loopBloc.add(const IncrementCounter(value: 1));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
