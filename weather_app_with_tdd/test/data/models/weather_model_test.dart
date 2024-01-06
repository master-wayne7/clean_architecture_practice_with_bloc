import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_with_tdd/data/models/weather_model.dart';
import 'package:weather_app_with_tdd/domain/entities/weather.dart';

import '../../helper/json_reader.dart';

void main() {
  const weatherModel = WeatherModel(
    cityName: "New York",
    main: "Clouds",
    description: "few clouds",
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  group(
    "weather model",
    () {
      test(
        "should be a sub class of weather entity",
        () async {
          // assert
          expect(weatherModel, isA<WeatherEntity>());
        },
      );
      test(
        "should return a valid model from json",
        () async {
          // arrange
          final Map<String, dynamic> jsonMap = jsonDecode(readJson('/helper/dummy_data/dummy_weather_response.json'));

          // act
          final result = WeatherModel.fromJson(jsonMap);

          // assert
          expect(result, weatherModel);
        },
      );
      test(
        "should return a json map containig proper data",
        () async {
          // act
          final result = weatherModel.toJson();

          // assert
          final expectedJsonMap = {
            'weather': [
              {
                'main': 'Clouds',
                'description': 'few clouds',
                'icon': '02d',
              }
            ],
            'main': {
              'temp': 302.28,
              'pressure': 1009,
              'humidity': 70,
            },
            'name': 'New York',
          };
          expect(result, expectedJsonMap);
        },
      );
    },
  );
}
