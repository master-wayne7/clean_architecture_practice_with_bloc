part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class OnCityChange extends WeatherEvent {
  final String cityName;
  const OnCityChange(this.cityName);

  @override
  List<Object?> get props => [
        cityName
      ];
}
