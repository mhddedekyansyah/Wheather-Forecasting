import 'package:equatable/equatable.dart';

class ForecastModel extends Equatable {
  final Main main;
  final List<Weather> weather;
  final String? timestamp;
  ForecastModel(
      {required this.main, required this.weather, required this.timestamp});

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
      timestamp: json['dt_txt'],
      main: Main.fromJson(json['main']),
      weather: json['weather'] != null
          ? (json['weather'] as Iterable)
              .map((e) => Weather.fromJson(e))
              .toList()
          : []);

  @override
  List<Object?> get props => [main, weather, timestamp];
}

class Main {
  final dynamic temp;
  final dynamic tempMax;
  final dynamic tempMin;
  Main({
    this.temp,
    this.tempMax,
    this.tempMin,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json['temp'],
        tempMax: json['temp_max'],
        tempMin: json['temp_min'],
      );
}

class Weather {
  final String? main;
  final String? description;
  final String? icon;
  Weather({
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
      );
}
