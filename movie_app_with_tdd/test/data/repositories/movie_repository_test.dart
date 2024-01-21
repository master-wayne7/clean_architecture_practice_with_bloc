import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_with_tdd/core/error/exceptions.dart';
import 'package:movie_app_with_tdd/core/error/failure.dart';
import 'package:movie_app_with_tdd/data/models/movie_model.dart';
import 'package:movie_app_with_tdd/data/repositories/movie_repository_impl.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MovieRepositoryImpl movieRepositoryImpl;
  late MockMovieRemoteDataSource mockMovieRemoteDataSource;

  setUp(() {
    mockMovieRemoteDataSource = MockMovieRemoteDataSource();
    movieRepositoryImpl = MovieRepositoryImpl(movieRemoteDataSource: mockMovieRemoteDataSource);
  });

  const testMovieModel = [
    MovieModel(
      id: 1,
      title: "title",
      overview: "overview",
      posterPath: "posterPath",
      adult: false,
      backdropPath: '',
      originalLanguage: '',
      originalTitle: '',
      mediaType: '',
      releaseDate: '',
      popularity: 0,
      voteAverage: 0,
      voteCount: 0,
    ),
  ];
  const testMovieEntity = [
    Movie(
      id: 1,
      title: "title",
      overview: "overview",
      posterPath: "posterPath",
      adult: false,
      backdropPath: '',
      originalLanguage: '',
      originalTitle: '',
      mediaType: '',
      releaseDate: '',
      popularity: 0,
      voteAverage: 0,
      voteCount: 0,
    ),
  ];

  const testSearch = "Batman";

  group("Movie Repository Implementation", () {
    group('GET popular movies', () {
      test("should return popular movies when a call to data source is successful", () async {
        // arrange
        when(mockMovieRemoteDataSource.getPopularMovies()).thenAnswer((_) async => testMovieModel);
        // act
        final result = await movieRepositoryImpl.getPopularMovies();
        // assert
        result.fold(
          (left) => fail('test failed'),
          (right) {
            verify(mockMovieRemoteDataSource.getPopularMovies()).called(1);
            verifyNoMoreInteractions(mockMovieRemoteDataSource);
            expect(
              right,
              equals(testMovieEntity),
            );
          },
        );
      });

      test("should return server failure when a call to data source is unsuccessful", () async {
        // arrange
        when(mockMovieRemoteDataSource.getPopularMovies()).thenThrow(ServerException());
        // act
        final result = await movieRepositoryImpl.getPopularMovies();
        // assert
        expect(result, equals(const Left(ServerFailure('An error occurred'))));
      });

      test("should return connection failure when device has no internet", () async {
        // arrange
        when(mockMovieRemoteDataSource.getPopularMovies()).thenThrow(const SocketException('No Internet connection available!'));
        // act
        final result = await movieRepositoryImpl.getPopularMovies();
        // assert
        expect(result, equals(const Left(ConnectionFailure('No Internet connection available!'))));
      });
    });
    group('GET trending movies', () {
      test("should return trending movies when a call to data source is successful", () async {
        // arrange
        when(mockMovieRemoteDataSource.getTrendingMovies()).thenAnswer((_) async => testMovieModel);
        // act
        final result = await movieRepositoryImpl.getTrendingMovies();
        // assert
        result.fold(
          (left) => fail('test failed'),
          (right) {
            verify(mockMovieRemoteDataSource.getTrendingMovies()).called(1);
            verifyNoMoreInteractions(mockMovieRemoteDataSource);
            expect(
              right,
              equals(testMovieEntity),
            );
          },
        );
      });

      test("should return server failure when a call to data source is unsuccessful", () async {
        // arrange
        when(mockMovieRemoteDataSource.getTrendingMovies()).thenThrow(ServerException());
        // act
        final result = await movieRepositoryImpl.getTrendingMovies();
        // assert
        expect(result, equals(const Left(ServerFailure('An error occurred'))));
      });

      test("should return connection failure when device has no internet", () async {
        // arrange
        when(mockMovieRemoteDataSource.getTrendingMovies()).thenThrow(const SocketException('No Internet connection available!'));
        // act
        final result = await movieRepositoryImpl.getTrendingMovies();
        // assert
        expect(result, equals(const Left(ConnectionFailure('No Internet connection available!'))));
      });
    });
    group('search movies', () {
      test("should return searched movies when a call to data source is successful", () async {
        // arrange
        when(mockMovieRemoteDataSource.searchMovies(testSearch)).thenAnswer((_) async => testMovieModel);
        // act
        final result = await movieRepositoryImpl.searchMovies(testSearch);
        // assert
        result.fold(
          (left) => fail('test failed'),
          (right) {
            verify(mockMovieRemoteDataSource.searchMovies(testSearch)).called(1);
            verifyNoMoreInteractions(mockMovieRemoteDataSource);
            expect(
              right,
              equals(testMovieEntity),
            );
          },
        );
      });

      test("should return server failure when a call to data source is unsuccessful", () async {
        // arrange
        when(mockMovieRemoteDataSource.searchMovies(testSearch)).thenThrow(ServerException());
        // act
        final result = await movieRepositoryImpl.searchMovies(testSearch);
        // assert
        expect(result, equals(const Left(ServerFailure('An error occurred'))));
      });

      test("should return connection failure when device has no internet", () async {
        // arrange
        when(mockMovieRemoteDataSource.searchMovies(testSearch)).thenThrow(const SocketException('No Internet connection available!'));
        // act
        final result = await movieRepositoryImpl.searchMovies(testSearch);
        // assert
        expect(result, equals(const Left(ConnectionFailure('No Internet connection available!'))));
      });
    });
  });
}
