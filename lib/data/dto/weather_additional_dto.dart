import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/data/http/owm_api/models/api_weather_response_dto.dart';

part 'weather_additional_dto.g.dart';

@JsonSerializable()
class WeatherAdditionalDto extends Equatable {
  final int temperatureFeelsLike;
  final int pressure;
  final int humidity;
  final int visibility;
  final int windSpeed;
  final int windDeg;
  final int? windGust;
  final int cloudsInPercent;
  final int sunriseTime;
  final int sunsetTime;
  final int? rainOneHour;
  final int? rainThreeHours;
  final int? snowOneHour;
  final int? snowThreeHours;

  const WeatherAdditionalDto({
    required this.temperatureFeelsLike,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.cloudsInPercent,
    required this.sunriseTime,
    required this.sunsetTime,
    required this.rainOneHour,
    required this.rainThreeHours,
    required this.snowOneHour,
    required this.snowThreeHours,
  });

  const WeatherAdditionalDto.initial()
      : this(
    temperatureFeelsLike: -5,
    pressure: 1007,
    humidity: 92,
    visibility: 10000,
    windSpeed: 1,
    windDeg: 60,
    windGust: null,
    cloudsInPercent: 40,
    sunriseTime: 1679885702,
    sunsetTime: 1679932293,
    rainOneHour: null,
    rainThreeHours: null,
    snowOneHour: null,
    snowThreeHours: null,
  );

  WeatherAdditionalDto.fromApiResponse({required ApiWeatherResponseDto response})
      : this(
          temperatureFeelsLike: response.main.feelsLike.toInt(),
          pressure: response.main.pressure.toInt(),
          humidity: response.main.humidity.toInt(),
          visibility: response.visibility.toInt(),
          windSpeed: response.wind.speed.toInt(),
          windDeg: response.wind.deg.toInt(),
          windGust:
              response.wind.gust != null ? response.wind.gust!.toInt() : null,
          cloudsInPercent: response.clouds.all.toInt(),
          sunriseTime: response.sys.sunrise.toInt(),
          sunsetTime: response.sys.sunset.toInt(),
          rainOneHour: response.rain != null
              ? (response.rain!.oneHour != null
                  ? response.rain!.oneHour!.toInt()
                  : null)
              : null,
          rainThreeHours: response.rain != null
              ? (response.rain!.threeHours != null
                  ? response.rain!.threeHours!.toInt()
                  : null)
              : null,
          snowOneHour: response.snow != null
              ? (response.snow!.oneHour != null
                  ? response.snow!.oneHour!.toInt()
                  : null)
              : null,
          snowThreeHours: response.snow != null
              ? (response.snow!.threeHours != null
                  ? response.snow!.threeHours!.toInt()
                  : null)
              : null,
        );

  factory WeatherAdditionalDto.fromJson(final Map<String, dynamic> json) =>
      _$WeatherAdditionalDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherAdditionalDtoToJson(this);

  @override
  List<Object?> get props => [
        temperatureFeelsLike,
        pressure,
        humidity,
        visibility,
        windSpeed,
        windDeg,
        windGust,
        cloudsInPercent,
        sunriseTime,
        sunsetTime,
        rainOneHour,
        rainThreeHours,
        snowOneHour,
        snowThreeHours,
      ];

  @override
  bool? get stringify => true;
}
