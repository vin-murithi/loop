import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loop/services/firestore_database.dart';
import 'package:loop/services/weather_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

//Event handling and callbacks class
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  //Initiate the handler with the first state, WeatherLoading
  WeatherBloc() : super(WeatherLoading()) {
    on<LoadCityWeather>((event, emit) async {
      try {
        final Map weather = await WeatherData().getCityWeather('Nairobi');
        emit(WeatherLoaded(weatherData: weather));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
    on<AddCityName>((event, emit) async {
      String collection = 'weather';
      String document = 'cityNames';
      Map<String, String> keyValue = {
        event.cityName: DateTime.now().toString()
      };
      emit(AddingCityName());
      try {
        await FireStoreDb().addToDocument(
            collection: collection, document: document, keyValue: keyValue);
        emit(CityNameAdded());
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
  }
}
