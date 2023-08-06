import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/secrets.dart';
import 'hourly_forecast.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  //app Id should be always stored in a seperate file and put in gitignore to avoid pushing to github or while deploying
  Future getCurrentWeather() async {
    String cityName = 'London';
    http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$openWeatherAPIKey'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WEATHER APP',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: const Column(
                      children: [
                        Text(
                          '100°F',
                          style: TextStyle(fontSize: 32),
                        ),
                        Icon(
                          Icons.cloud,
                          size: 72,
                        ),
                        Text(
                          'Rain',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'WEATHER FORECAST',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecast(
                    icon: Icons.cloud,
                    temperature: '301.7',
                    time: '9:00',
                  ),
                  HourlyForecast(
                    icon: Icons.cloud,
                    temperature: '301.7',
                    time: '9:00',
                  ),
                  HourlyForecast(
                    icon: Icons.cloud,
                    temperature: '301.7',
                    time: '9:00',
                  ),
                  HourlyForecast(
                    icon: Icons.cloud,
                    temperature: '301.7',
                    time: '9:00',
                  ),
                  HourlyForecast(
                    icon: Icons.cloud,
                    temperature: '301.7',
                    time: '9:00',
                  ),
                  HourlyForecast(
                    icon: Icons.cloud,
                    temperature: '301.7',
                    time: '9:00',
                  ),
                  HourlyForecast(
                    icon: Icons.cloud,
                    temperature: '301.7',
                    time: '9:00',
                  ),
                  HourlyForecast(
                    icon: Icons.cloud,
                    temperature: '301.7',
                    time: '9:00',
                  ),
                  HourlyForecast(
                    icon: Icons.cloud,
                    temperature: '301.7',
                    time: '9:00',
                  ),
                  HourlyForecast(
                    icon: Icons.cloud,
                    temperature: '301.7',
                    time: '9:00',
                  ),
                  HourlyForecast(
                    icon: Icons.cloud,
                    temperature: '301.7',
                    time: '9:00',
                  ),
                  HourlyForecast(
                    icon: Icons.cloud,
                    temperature: '301.7',
                    time: '9:00',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'ADDITIONAL INFORMATION',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AdditionalInformation(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '90',
                ),
                AdditionalInformation(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '7.1',
                ),
                AdditionalInformation(
                  icon: Icons.beach_access,
                  label: 'Pressure',
                  value: '5.3',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
