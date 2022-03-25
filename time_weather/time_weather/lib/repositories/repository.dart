import 'package:dio/dio.dart';
import 'package:time_weather/model/weather_entity.dart';

class WeatherRepository {
  String url = 'https://goweather.herokuapp.com/weather';
  Future<WeatherEntity> weatherResponse(String city) async {
    Response response = await Dio().get("$url/$city");
    return WeatherEntity.fromJson(response.data);
  }
}
