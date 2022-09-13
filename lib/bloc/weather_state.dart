part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Map weatherData;
  const WeatherLoaded({this.weatherData = const {}});
  @override
  List<Object> get props => [weatherData];
}

class WeatherError extends WeatherState {
  final String? errorMessage;
  const WeatherError(this.errorMessage);
}
class AddingCityName extends WeatherState {}
class CityNameAdded extends WeatherState {}
