import 'package:flutter/material.dart';
import 'package:loop/services/weather_data.dart';

class CityWeatherCard extends StatefulWidget {
  final String cityName;
  final Map weatherData;
  const CityWeatherCard(
      {super.key, required this.cityName, required this.weatherData});

  @override
  State<CityWeatherCard> createState() => _CityWeatherCardState();
}

class _CityWeatherCardState extends State<CityWeatherCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.97;
    double height = MediaQuery.of(context).size.height * 0.2;
    return Container(
      width: width,
      height: height,
      child: Card(
        elevation: 4,
        child: Row(
          children: [
            //Left Side
            Container(
              width: width * 0.35,
              height: height,
              color: Colors.grey.shade50,
              child: Column(
                children: [
                  Container(
                    height: height * 0.2,
                    child: Text(widget.cityName),
                  ),
                  Container(
                      height: height * 0.5,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.weatherData['temperature'],
                              textScaleFactor: 3,
                            ),
                            const Text(
                              '°C',
                              textScaleFactor: 0.8,
                            ),
                          ])),
                  Container(
                    height: height * 0.15,
                    child: Text('${widget.weatherData['description']}'),
                  ),
                ],
              ),
            ),
            //Right Side
            Expanded(
              child: Container(
                height: height,
                color: Colors.grey.shade500,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Today's Forecast",
                          textScaleFactor: 1.1,
                          style: TextStyle(
                              // color: Colors.grey.shade50,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Text(
                        'Cloud Cover: ${widget.weatherData['clouds']}',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                            // color: Colors.grey.shade50,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Humidity: ${widget.weatherData['humidity']}',
                        textScaleFactor: 1.1,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Wind: ${widget.weatherData['wind']}',
                        textScaleFactor: 1.1,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
