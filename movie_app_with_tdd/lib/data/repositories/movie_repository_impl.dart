import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie_app_with_tdd/core/error/exceptions.dart';
import 'package:movie_app_with_tdd/core/error/failure.dart';
import 'package:movie_app_with_tdd/data/data_sources/remote_data_source.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';
import 'package:movie_app_with_tdd/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  MovieRepositoryImpl({required this.movieRemoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await movieRemoteDataSource.getPopularMovies();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('An error occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('No Internet connection available!'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies() async {
    try {
      final result = await movieRemoteDataSource.getTrendingMovies();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('An error occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('No Internet connection available!'));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
    try {
      final result = await movieRemoteDataSource.searchMovies(query);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('An error occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('No Internet connection available!'));
    }
  }
}
