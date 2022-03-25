import 'package:time_weather/model/weather_entity.dart';

import '../repositories/repository.dart';

class WeatherController {
  WeatherRepository weatherRepository = WeatherRepository();
  WeatherEntity entidade = WeatherEntity();
  String city = 'Campos';
  List<String> entity = [];

  set setCity(String cityName) {
    city = cityName;
  }

  Future<WeatherEntity> showWheather() async {
    return await weatherRepository.weatherResponse(city);
    //weatherCidade.then((value) => );
  }
}
