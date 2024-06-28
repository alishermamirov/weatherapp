// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:obhavo_bloc/data/models/weather.dart';
import 'package:obhavo_bloc/helpers/extensions/string_extensions.dart';

class CityWeather extends StatelessWidget {
  final Weather weather;
  const CityWeather({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${weather.city.capitalizaString()}",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "${weather.temperature.toStringAsFixed(0)} *C",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "${weather.main}",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "${weather.desc}",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
