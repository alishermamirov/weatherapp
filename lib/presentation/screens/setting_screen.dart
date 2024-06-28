import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obhavo_bloc/logic/cubit/settings/settings_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  static const routeName = "/settings";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListTile(
        title: Text("Temperature unit"),
        subtitle: Text("celcius/Fahrenheit"),
        trailing: Switch.adaptive(
          value: context.watch<SettingsCubit>().state.tempUnits ==
                  TempUnits.celcius
              ? true
              : false,
          onChanged: (value) {
            context.read<SettingsCubit>().toggleTemperature();
          },
        ),
      ),
    );
  }
}
