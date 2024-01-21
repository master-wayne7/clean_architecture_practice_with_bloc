import 'package:dartz/dartz.dart';
import 'package:movie_app_with_tdd/core/error/failure.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';
import 'package:movie_app_with_tdd/domain/repositories/movie_repository.dart';

class GetTrendingMoviesUseCase {
  final MovieRepository movieRepository;
  const GetTrendingMoviesUseCase({required this.movieRepository});

  Future<Either<Failure, List<Movie>>> call() {
    return movieRepository.getTrendingMovies();
  }
}
