import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:movie_app_with_tdd/core/error/exceptions.dart';
import 'package:movie_app_with_tdd/data/data_sources/remote/movie_remote_data_source_impl.dart';
import 'package:movie_app_with_tdd/data/data_sources/remote_data_source.dart';
import 'package:movie_app_with_tdd/data/models/movie_model.dart';
import '../../helper/json_reader.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late MockHttpClient httpClient;
  late MovieRemoteDataSource movieDataSource;
  setUp(() {
    httpClient = MockHttpClient();
    movieDataSource = MovieRemoteDataSourceImpl(httpClient: httpClient);
  });
  const testMovieName = "Batman";

  const tUrl = 'https://api.themoviedb.org/3/trending/movie/day?language=en-US&page=1&api_key=9f1ebfb60f6a6b25f94237b294e91ebb';
  const pUrl = 'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=9f1ebfb60f6a6b25f94237b294e91ebb';
  const sUrl = 'https://api.themoviedb.org/3/search/movie?query=Batman&language=en-US&page=1&api_key=9f1ebfb60f6a6b25f94237b294e91ebb';

  group("movie remote data source", () {
    group("GET trending movies API method", () {
      test(
        'should return a list of movies when status is 200',
        () async {
          // arrange
          when(
            httpClient.get(
              Uri.parse(tUrl),
            ),
          ).thenAnswer(
            (_) async => http.Response(readJson('helper/dummy/dummy_data_list.json'), 200),
          );
          // act
          final result = await movieDataSource.getTrendingMovies();

          // assert
          expect(result, isA<List<MovieModel>>());
        },
      );
      test(
        'should throw a server exception when response code is 404 or other',
        () async {
          // arrange
          when(
            httpClient.get(
              Uri.parse(tUrl),
            ),
          ).thenAnswer(
            (_) async => http.Response('Not found', 400),
          );

          // act
          final result = movieDataSource.getTrendingMovies();

          // assert
          expect(result, throwsA(isA<ServerException>()));
        },
      );
    });
    group("GET popular movies API method", () {
      test(
        'should return a list of movies when status is 200',
        () async {
          // arrange
          when(
            httpClient.get(
              Uri.parse(pUrl),
            ),
          ).thenAnswer(
            (_) async => http.Response(readJson('helper/dummy/dummy_data_list.json'), 200),
          );
          // act
          final result = await movieDataSource.getPopularMovies();

          // assert
          expect(result, isA<List<MovieModel>>());
        },
      );
      test(
        'should throw a server exception when response code is 404 or other',
        () async {
          // arrange
          when(
            httpClient.get(
              Uri.parse(pUrl),
            ),
          ).thenAnswer(
            (_) async => http.Response('Not found', 400),
          );

          // act
          final result = movieDataSource.getPopularMovies();

          // assert
          expect(result, throwsA(isA<ServerException>()));
        },
      );
    });
    group("search movies API method", () {
      test(
        'should return a list of movies when status is 200',
        () async {
          // arrange
          when(
            httpClient.get(
              Uri.parse(sUrl),
            ),
          ).thenAnswer(
            (_) async => http.Response(readJson('helper/dummy/dummy_data_list.json'), 200),
          );
          // act
          final result = await movieDataSource.searchMovies(testMovieName);

          // assert
          expect(result, isA<List<MovieModel>>());
        },
      );
      test(
        'should throw a server exception when response code is 404 or other',
        () async {
          // arrange
          when(
            httpClient.get(
              Uri.parse(sUrl),
            ),
          ).thenAnswer(
            (_) async => http.Response('Not found', 400),
          );

          // act
          final result = movieDataSource.searchMovies(testMovieName);

          // assert
          expect(result, throwsA(isA<ServerException>()));
        },
      );
    });
  });
}
