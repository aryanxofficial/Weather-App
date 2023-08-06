import 'package:flutter/material.dart';

class AdditionalInformation extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalInformation(
    {super.key, 
    required this.icon,
    required this.label,
    required this.value}
    );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Icon(icon),
          Text(label),
          Text(value)
        ],
      ),
    );
  }
}
