import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_with_tdd/core/error/failure.dart';
import 'package:weather_app_with_tdd/domain/entities/weather.dart';
import 'package:weather_app_with_tdd/presentation/bloc/weather_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late MockGetCurrentWeatherUserCase mockGetCurrentWeatherUserCase;
  late WeatherBloc weatherBloc;

  setUp(() {
    mockGetCurrentWeatherUserCase = MockGetCurrentWeatherUserCase();
    weatherBloc = WeatherBloc(mockGetCurrentWeatherUserCase);
  });

  const testWeatherEntity = WeatherEntity(
    cityName: 'New York',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  const cityName = "New York";

  group("weather bloc", () {
    test("initial state should be empty", () {
      expect(weatherBloc.state, WeatherEmpty());
    });

    blocTest<WeatherBloc, WeatherState>(
      'emits [WeatherLoading,WeatherLoaded] when data is gotten successfully.',
      build: () {
        when(mockGetCurrentWeatherUserCase.execute(cityName)).thenAnswer((_) async => const Right(testWeatherEntity));
        return weatherBloc;
      },
      act: (bloc) => bloc.add(const OnCityChange(cityName)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        WeatherLoading(),
        const WeatherLoaded(testWeatherEntity)
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits [WeatherLoading,WeatherLoadFailure] when get data is unsuccessful.',
      build: () {
        when(mockGetCurrentWeatherUserCase.execute(cityName)).thenAnswer((_) async => const Left(ServerFailure("Server Failure")));
        return weatherBloc;
      },
      act: (bloc) => bloc.add(const OnCityChange(cityName)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        WeatherLoading(),
        const WeatherLoadFailure("Server Failure")
      ],
    );
  });
}
