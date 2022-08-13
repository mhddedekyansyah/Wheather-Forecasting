import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecasting/models/forecast_model.dart';
import 'package:weather_forecasting/services/constant.dart';

class DetailWeather extends StatelessWidget {
  ForecastModel weather;
  DetailWeather({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: [
              Text(
                '${DateFormat.yMMMEd().format(DateTime.parse(weather.timestamp!))}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  ' ${DateFormat.jm().format(DateTime.parse(weather.timestamp!))}',
                  style: const TextStyle(fontSize: 20)),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${weather.main.temp} ℃',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 35),
                  ),
                  Image.network(
                    '${Constant.urlImg}${weather.weather.first.icon}.png',
                    width: 170,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '${weather.weather.first.main} (${weather.weather.first.description})',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Temp(min)',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${weather.main.tempMin} ℃',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Temp(max)',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${weather.main.tempMax} ℃',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
