// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:obhavo_bloc/data/models/weather.dart';
import 'package:obhavo_bloc/helpers/extensions/string_extensions.dart';
import 'package:obhavo_bloc/logic/cubit/settings/settings_cubit.dart';

class CityWeather extends StatefulWidget {
  final Weather weather;
  const CityWeather({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  State<CityWeather> createState() => _CityWeatherState();
}

class _CityWeatherState extends State<CityWeather> {
  String _showTemp(double temp) {
    final tempunit = context.watch<SettingsCubit>().state.tempUnits;
    if (tempunit == TempUnits.fahrenheit) {
      return "${((temp * 9 / 5) + 32)}*F";
    } else {
      return "$temp *C";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${widget.weather.city.capitalizaString()}",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            _showTemp(widget.weather.temperature),
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "${widget.weather.main}",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "${widget.weather.desc}",
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
