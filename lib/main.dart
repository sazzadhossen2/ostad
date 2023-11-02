import 'dart:convert';
import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jsonWeatherData = '''
    [
      {
        "city": "New York",
        "temperature": 20,
        "condition": "Clear",
        "humidity": 60,
        "windSpeed": 5.5
      },
      {
        "city": "Los Angeles",
        "temperature": 25,
        "condition": "Sunny",
        "humidity": 50,
        "windSpeed": 6.8
      },
      {
        "city": "London",
        "temperature": 15,
        "condition": "Partly Cloudy",
        "humidity": 70,
        "windSpeed": 4.2
      },
      {
        "city": "Tokyo",
        "temperature": 28,
        "condition": "Rainy",
        "humidity": 75,
        "windSpeed": 8.0
      },
      {
        "city": "Sydney",
        "temperature": 22,
        "condition": "Cloudy",
        "humidity": 55,
        "windSpeed": 7.3
      }
    ]
    ''';

    final List<Weather> weatherData = (json.decode(jsonWeatherData) as List)
        .map((data) => Weather.fromJson(data))
        .toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Information'),
        ),
        body: ListView.builder(
          itemCount: weatherData.length,
          itemBuilder: (context, index) {
            final weather = weatherData[index];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(

                child: ListTile(
                  title: Text("City:"+weather.city,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  subtitle: Text(
                    'Temperature: ${weather.temperature}°C\n'
                        'Condition: ${weather.condition}\n'
                        'Humidity: ${weather.humidity}%\n'
                        'Wind Speed: ${weather.windSpeed} m/s',
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


