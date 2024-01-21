import 'package:dartz/dartz.dart';
import 'package:movie_app_with_tdd/core/error/failure.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getTrendingMovies();
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
  Future<Either<Failure, List<Movie>>> getPopularMovies();
}
