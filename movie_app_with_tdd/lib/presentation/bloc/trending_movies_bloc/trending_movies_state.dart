// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'trending_movies_bloc.dart';

sealed class TrendingMoviesState extends Equatable {
  const TrendingMoviesState();

  @override
  List<Object?> get props => [];
}

final class TrendingMoviesInitial extends TrendingMoviesState {}

final class TrendingMoviesLoading extends TrendingMoviesState {}

final class TrendingMoviesLoaded extends TrendingMoviesState {
  final List<Movie> trendingMovies;
  const TrendingMoviesLoaded(this.trendingMovies);

  @override
  List<Object?> get props => [
        trendingMovies
      ];
}

final class TrendingMoviesError extends TrendingMoviesState {
  final String message;
  const TrendingMoviesError(this.message);
  @override
  List<Object?> get props => [
        message
      ];
}
