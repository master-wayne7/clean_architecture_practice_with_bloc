import 'package:dartz/dartz.dart';
import 'package:movie_app_with_tdd/core/error/failure.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';
import 'package:movie_app_with_tdd/domain/repositories/movie_repository.dart';

class SearchMoviesUseCase {
  final MovieRepository movieRepository;
  const SearchMoviesUseCase({required this.movieRepository});

  Future<Either<Failure, List<Movie>>> call(String query) {
    return movieRepository.searchMovies(query);
  }
}
