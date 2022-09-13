import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:loop/privateConstants.dart';

//Class deals with all matters weather data
class WeatherData {
  //Takes in city name, returns weather data from API
  Future<Map> getCityWeather(String city) async {
    //Create the uri
    final uriParameters = {
      'q': city,
      'appid': openWeatherApiKey,
      'units': 'metric',
    };
    final uri =
        Uri.https('api.openweathermap.org', 'data/2.5/weather', uriParameters);

    //get response
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    // print(json);
    return json;
  }
}
