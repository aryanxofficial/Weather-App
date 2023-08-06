import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;
  const HourlyForecast({super.key, required this.time, required this.icon, required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                time,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
              Icon(
                icon,
                size: 40,
              ),
              Text(
                temperature,
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
