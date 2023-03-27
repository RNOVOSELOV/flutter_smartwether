import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/data/http/owm_api/models/api_weather_response_dto.dart';

part 'weather_dto.g.dart';

@JsonSerializable()
class WeatherDto extends Equatable {
  final String description;
  final String icon;
  final int temperature;
  final int temperatureMin;
  final int temperatureMax;

  const WeatherDto({
    required this.description,
    required this.icon,
    required this.temperature,
    required this.temperatureMin,
    required this.temperatureMax,
  });

  const WeatherDto.initial()
      : this(
    description: 'переменная облачность',
    icon: '03n',
    temperature: -6,
    temperatureMin: -10,
    temperatureMax: -5,
  );

  WeatherDto.fromApiResponse({required ApiWeatherResponseDto response})
      : this(
          description: response.weather.first.description,
          icon: response.weather.first.icon,
          temperature: response.main.temp.toInt(),
          temperatureMin: response.main.tempMin.toInt(),
          temperatureMax: response.main.tempMax.toInt(),
        );

  factory WeatherDto.fromJson(final Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);

  @override
  List<Object?> get props => [
        description,
        icon,
        temperature,
        temperatureMin,
        temperatureMax,
      ];

  @override
  bool? get stringify => true;
}
