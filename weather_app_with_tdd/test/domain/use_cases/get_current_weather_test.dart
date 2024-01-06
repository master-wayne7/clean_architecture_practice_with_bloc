import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_with_tdd/domain/entities/weather.dart';
import 'package:weather_app_with_tdd/domain/use_cases/get_current_weather.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late GetCurrentWeatherUserCase getCurrentWeatherUserCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getCurrentWeatherUserCase = GetCurrentWeatherUserCase(mockWeatherRepository);
  });

  const testWeatherDetail = WeatherEntity(
    cityName: "New York",
    main: "Clouds",
    description: "few clouds",
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1000,
    humidity: 70,
  );

  const testCityName = "New York";

  group("get current weather use case", () {
    test(
      "should get current weather detail from the repository",
      () async {
        // arrange
        when(mockWeatherRepository.getCurrentWeather(testCityName)).thenAnswer((_) async => const Right(testWeatherDetail));

        // act

        final result = await getCurrentWeatherUserCase.execute(testCityName);

        // assert
        expect(result, const Right(testWeatherDetail));
      },
    );
  });
}
