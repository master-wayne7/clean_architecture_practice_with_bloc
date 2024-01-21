part of 'popular_movies_bloc.dart';

sealed class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object?> get props => [];
}

final class PopularMoviesInitial extends PopularMoviesState {}

final class PopularMoviesLoading extends PopularMoviesState {}

final class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> popularMovies;
  const PopularMoviesLoaded(this.popularMovies);
  @override
  List<Object?> get props => [
        popularMovies
      ];
}

final class PopularMoviesError extends PopularMoviesState {
  final String message;
  const PopularMoviesError(this.message);
  @override
  List<Object?> get props => [
        message
      ];
}
