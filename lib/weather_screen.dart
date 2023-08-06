import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/secrets.dart';
import 'hourly_forecast.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0;

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  //app Id should be always stored in a seperate file and put in gitignore to avoid pushing to github or while deploying
  Future getCurrentWeather() async {
    try {
      String cityName = 'London';
      final res = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey'),
      );

      final data = jsonDecode(res.body);
      if (data['cod'] != '200') {
        throw 'An error occured while fetching data from API';
      }

      print(data['list'][0]['main']['temp']); //printing the value on terminal

      setState(() {
        temp = data['list'][0]['main']['temp'];
      });
    } catch (e) {
      throw e.toString();
    }
    // print(res.body);
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
      body: temp ==
              0 //here if bascially jab tak ai se temperature fetch nahi hoga I am showing loading indicator for better user experience
          ? const Align(alignment: Alignment.center,child: CircularProgressIndicator())//alignment.center is making that circular loading in center
          : Padding(
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
                          child: Column(
                            children: [
                              Text(
                                '$temp K',
                                style: const TextStyle(fontSize: 32),
                              ),
                              const Icon(
                                Icons.cloud,
                                size: 72,
                              ),
                              const Text(
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
