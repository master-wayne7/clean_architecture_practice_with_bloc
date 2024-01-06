import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_with_tdd/core/constants/constants.dart';
import 'package:weather_app_with_tdd/core/error/exception.dart';
import 'package:weather_app_with_tdd/data/data_sources/remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_with_tdd/data/models/weather_model.dart';
import '../../helper/json_reader.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late WeatherRemoteDataSourceImpl weatherRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    weatherRemoteDataSourceImpl = WeatherRemoteDataSourceImpl(client: mockHttpClient);
  });

  const testCityName = 'New York';

  group('get current weather', () {
    test(
      "should return weather model when response code is 200",
      () async {
        // arrange
        when(mockHttpClient.get(Uri.parse(Urls.currentWeatherByName(testCityName)))).thenAnswer(
          (_) async => http.Response(readJson('helper/dummy_data/dummy_weather_response.json'), 200),
        );
        // act
        final result = await weatherRemoteDataSourceImpl.getCurrentWeather(testCityName);

        // assert
        expect(result, isA<WeatherModel>());
      },
    );
    test(
      "should throw a server exception when response code is 404 or other",
      () async {
        //arrange
        when(
          mockHttpClient.get(Uri.parse(Urls.currentWeatherByName(testCityName))),
        ).thenAnswer((_) async => http.Response('Not found', 404));

        //act
        final result = weatherRemoteDataSourceImpl.getCurrentWeather(testCityName);

        //assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });
}
