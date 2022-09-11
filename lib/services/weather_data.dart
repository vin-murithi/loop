import 'package:http/http.dart' as http;

//Class deals with all matters weather data
class WeatherData {
  void getWeather(String city) {
    //Create the uri
    final uriParameters = {'q':city,};
    final uri = Uri.https('','',uriParameters);
  }
}
