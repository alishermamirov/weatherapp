import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obhavo_bloc/presentation/screens/search_screen.dart';
import 'package:obhavo_bloc/presentation/screens/setting_screen.dart';
import 'package:obhavo_bloc/presentation/widgets/city_weather.dart';

import '../../logic/cubit/weather/weather_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _city = "Tashkent";
  @override
  void initState() {
    super.initState();
    getweatherData();
  }

  void getweatherData() async {
    // final weatherRep = WeatherRepository(
    //     weatherApiServices: WeatherApiServices(client: Client()));
    // final weather = await weatherRep.getWeather("Jizzakh");
    // print("${weather.temperature}");
    context.read<WeatherCubit>().getWeather(_city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather app"),
        actions: [
          IconButton(
            onPressed: () async {
              final city =
                  await Navigator.pushNamed(context, SearchScreen.routeName);
              if (city != null) {
                _city = city.toString();
                getweatherData();
              }
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SettingScreen.routeName);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherError) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text(state.message),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok"),
                    ),
                  ],
                );
              },
            );
            if (state.message.toLowerCase().contains("not found")) {
              _city = "tashkent";
              getweatherData();
            }
            ;
          }
          ;
        },
        builder: (context, state) {
          if (state is WeatherInitial) {
            return Center(
              child: Text("Select City"),
            );
          }
          if (state is WeatherLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherLoaded) {
            return CityWeather(
              weather: state.weather,
            );
          }
          return Container();
        },
      ),
    );
  }
}
