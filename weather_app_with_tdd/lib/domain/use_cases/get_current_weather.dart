import 'package:dartz/dartz.dart';
import 'package:weather_app_with_tdd/core/error/failure.dart';
import 'package:weather_app_with_tdd/domain/entities/weather.dart';
import 'package:weather_app_with_tdd/domain/repositories/weather_repository.dart';

class GetCurrentWeatherUserCase {
  final WeatherRepository weatherRepository;

  const GetCurrentWeatherUserCase(this.weatherRepository);

  Future<Either<Failure, WeatherEntity>> execute(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}
