import 'package:mockito/annotations.dart';
import 'package:weather_app_with_tdd/data/data_sources/remote_data_source.dart';
import 'package:weather_app_with_tdd/domain/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_with_tdd/domain/use_cases/get_current_weather.dart';

@GenerateMocks([
  WeatherRepository,
  WeatherRemoteDataSource,
  GetCurrentWeatherUserCase
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
