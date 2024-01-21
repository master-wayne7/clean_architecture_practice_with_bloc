part of 'searched_movies_bloc.dart';

sealed class SearchedMoviesState extends Equatable {
  const SearchedMoviesState();

  @override
  List<Object?> get props => [];
}

final class SearchedMoviesInitial extends SearchedMoviesState {}

final class SearchedMoviesLoading extends SearchedMoviesState {}

final class SearchedMoviesLoaded extends SearchedMoviesState {
  final List<Movie> searchedMovies;
  const SearchedMoviesLoaded(this.searchedMovies);
  @override
  List<Object?> get props => [
        searchedMovies
      ];
}

final class SearchedMoviesError extends SearchedMoviesState {
  final String message;
  const SearchedMoviesError(this.message);
  @override
  List<Object?> get props => [
        message
      ];
}
