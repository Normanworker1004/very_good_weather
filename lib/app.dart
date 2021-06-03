import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_weather/api/weather_repository.dart';
import 'package:very_good_weather/state/blocs/theme_bloc.dart';
import 'package:very_good_weather/state/blocs/weather_bloc.dart';
import 'package:very_good_weather/state/theme_state.dart';
import 'package:very_good_weather/ui/screens/weather_screen.dart';

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  App({Key? key, required this.weatherRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          title: 'Flutter Weather',
          theme: themeState.theme,
          home: BlocProvider(
            create: (context) =>
                WeatherBloc(weatherRepository: weatherRepository),
            child: Weather(),
          ),
        );
      },
    );
  }
}