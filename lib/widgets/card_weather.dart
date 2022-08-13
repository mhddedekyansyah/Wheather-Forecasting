import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecasting/models/forecast_model.dart';
import 'package:weather_forecasting/services/constant.dart';

class CardWeather extends StatelessWidget {
  ForecastModel weather;
  CardWeather({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(width: .2)),
      child: Row(
        children: [
          Image.network(
            '${Constant.urlImg}${weather.weather.first.icon}.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${DateFormat.yMMMEd().format(DateTime.parse(weather.timestamp!))} ${DateFormat.jm().format(DateTime.parse(weather.timestamp!))}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              Text('${weather.weather.first.main}'),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Temp: ${weather.main.temp} ℃',
                style: TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
