class ForecastEntity {
  final String day;
  final String temperature;
  final String wind;
  ForecastEntity({
    this.day = '',
    this.temperature = '',
    this.wind = '',
  });

  factory ForecastEntity.fromJson(Map<String, dynamic> json) {
    return ForecastEntity(
      day: json["day"],
      temperature: json["temperature"],
      wind: json["wind"],
    );
  }

  Map<String, dynamic> toJson() => {
        "day": day,
        "temperature": temperature,
        "wind": wind,
      };
}
