part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

//Define the Load event
class LoadCityWeather extends WeatherEvent {
  final Map weatherData;
  const LoadCityWeather({this.weatherData = const {}});
  @override
  List<Object> get props => [weatherData];
}

class AddCityName extends WeatherEvent {
  final String cityName;
  const AddCityName({required this.cityName});
  @override
  List<Object> get props => [cityName];
}
