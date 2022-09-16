import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loop/bloc/loop_bloc.dart';
import 'package:loop/bloc/weather_bloc.dart';
import 'package:loop/screens/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  //Enable calling of native code
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize firebase which calls native code
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Use MultiBlocProvider to add Bloc functionality to entire app
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => WeatherBloc()..add(const LoadCityWeather())),
        BlocProvider(create: (context) => LoopBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const HomePage(title: 'In the loop'),
      ),
    );
  }
}
