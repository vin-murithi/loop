import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loop/bloc/loop_bloc.dart';
import 'package:loop/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Use MultiBlocProvider to add Bloc functionality to entire app
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: BlocProvider<LoopBloc>(
        create: (context) => LoopBloc(),
        child: MyHomePage(title: 'Loop'),
      ),
    );
  }
}
