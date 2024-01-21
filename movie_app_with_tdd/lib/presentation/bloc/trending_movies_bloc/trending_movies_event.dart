part of 'trending_movies_bloc.dart';

sealed class TrendingMoviesEvent {
  const TrendingMoviesEvent();
}

class FetchTrendingMovies extends TrendingMoviesEvent {}
