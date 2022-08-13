import 'package:dio/dio.dart';
import 'package:weather_forecasting/models/forecast_model.dart';

import 'package:weather_forecasting/services/constant.dart';

class ForecastService {
  Future<List<ForecastModel>?> getForecast() async {
    try {
      Response response = await Dio().get(
          '${Constant.apiUrl}?lat=${Constant.lat}&lon=${Constant.lon}&appid=${Constant.apiKey}&units=metric');
      if (response.statusCode == 200) {
        var data = response.data;

        List<ForecastModel> forecasts = (data['list'] as Iterable)
            .map((e) => ForecastModel.fromJson(e))
            .toList();

        return forecasts;
      }
    } catch (e) {
      throw e;
    }
  }
}
