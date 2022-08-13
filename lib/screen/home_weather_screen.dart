import 'package:flutter/material.dart';

import 'package:weather_forecasting/models/forecast_model.dart';
import 'package:weather_forecasting/screen/details_weather_screen.dart';

import 'package:weather_forecasting/services/forecast_service.dart';
import 'package:weather_forecasting/widgets/card_weather.dart';

class HomeWeatherScreen extends StatefulWidget {
  const HomeWeatherScreen({Key? key}) : super(key: key);

  @override
  State<HomeWeatherScreen> createState() => _HomeWeatherScreenState();
}

class _HomeWeatherScreenState extends State<HomeWeatherScreen> {
  @override
  void initState() {
    ForecastService().getForecast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('REBUILD');
    return RefreshIndicator(
      onRefresh: () => ForecastService().getForecast(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: Container(
            padding: const EdgeInsets.only(top: 8.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: FutureBuilder<List<ForecastModel>?>(
                  future: ForecastService().getForecast(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error} occured'),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Column(
                        children: snapshot.data!
                            .map((e) => InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailWeather(
                                          weather: e,
                                        ),
                                      )),
                                  child: CardWeather(
                                    weather: e,
                                  ),
                                ))
                            .toList());
                  }),
            )),
      ),
    );
  }
}
