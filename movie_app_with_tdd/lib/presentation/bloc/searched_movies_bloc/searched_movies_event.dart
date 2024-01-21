part of 'searched_movies_bloc.dart';

sealed class SearchedMoviesEvent {
  const SearchedMoviesEvent();
}

class OnSearchedMovies extends SearchedMoviesEvent {
  final String query;
  const OnSearchedMovies(this.query);
}
