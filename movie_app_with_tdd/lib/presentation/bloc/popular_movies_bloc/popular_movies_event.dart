part of 'popular_movies_bloc.dart';

sealed class PopularMoviesEvent {
  const PopularMoviesEvent();
}

class FetchPopularMovies extends PopularMoviesEvent {}
