import 'forecast_entity.dart';

class WeatherEntity {
  String? temperature;
  String? wind;
  String? description;
  List<ForecastEntity>? forecast;
  WeatherEntity({
    this.temperature = '',
    this.wind = '',
    this.description = '',
    this.forecast = const [],
  });

  /* factory WeatherEntity.fromJson(Map<String, dynamic> json) {
    return WeatherEntity(
      temperature: json['temperature'],
      wind: json['wind'],
      description: json['description'],
      forecast: json['forecast'],
    );
  } */

  WeatherEntity.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    wind = json['wind'];
    description = json['description'];
    if (json['forecast'] != null) {
      forecast = <ForecastEntity>[];
      json['forecast'].forEach((v) {
        forecast!.add(ForecastEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "wind": wind,
        "description": description,
        "forecast": forecast?.map((e) => e.toJson()).toList()
      };
}

var json = """ 
{
   "temperature":"+28 °C",
   "wind":"7 km/h",
   "description":"Sunny",
   "forecast":[
      {
         "day":"1",
         "temperature":"+29 °C",
         "wind":"7 km/h"
      },
      {
         "day":"2",
         "temperature":"28 °C",
         "wind":"8 km/h"
      },
      {
         "day":"3",
         "temperature":"32 °C",
         "wind":"11 km/h"
      }
   ]
}

""";
