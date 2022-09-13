import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loop/bloc/loop_bloc.dart';
import 'package:loop/bloc/weather_bloc.dart';
import 'package:loop/components/city_weather_card.dart';
import 'package:loop/components/text_input_alert.dart';
import 'package:loop/services/weather_data.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final myController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is CityNameAdded) {
          weatherBloc.add(const LoadCityWeather());
        }
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherLoaded) {
          Map weather = state.weatherData;
          String cityName = weather['name'];
          String country = weather['sys']['country'];
          double temp = weather['main']['temp'];
          String description = weather['weather'][0]['description'];
          double windspeed = weather['wind']['speed'];
          int humidity = weather['main']['humidity'];
          int cloudCover = weather['clouds']['all'];
          return Center(
            child: Column(
              children: <Widget>[
                CityWeatherCard(
                  cityName: '$cityName | $country',
                  weatherData: {
                    'clouds': '$cloudCover %',
                    'description': description,
                    'temperature': temp.toStringAsFixed(0),
                    'humidity': '$humidity %',
                    'wind': '$windspeed m/s',
                  },
                ),
                FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () async {
                      String addedCity = await ReusableDialog()
                          .displayTextInputDialog(
                              context,
                              myController,
                              'Add City',
                              'Provide the name of the city to track',
                              'Enter city name...');
                      print('addedCity: $addedCity');
                      //Add City to firestore using bloc
                      weatherBloc.add(AddCityName(cityName: addedCity));
                    })
              ],
            ),
          );
        } else if (state is WeatherError) {
          String? errorMsg = state.errorMessage;
          return Center(
            child: Text('Error: $errorMsg'),
          );
        } else if (state is AddCityName) {
          return const Center(
            child: Text('Adding City name ...'),
          );
        } else {
          return const Center(
            child: Text('Error Occured'),
          );
        }
      },
    );
  }
}
