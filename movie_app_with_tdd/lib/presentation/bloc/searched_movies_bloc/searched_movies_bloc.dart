import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';
import 'package:movie_app_with_tdd/domain/use_cases/search_movie_use_case.dart';
import 'package:rxdart/rxdart.dart';
part 'searched_movies_event.dart';
part 'searched_movies_state.dart';

class SearchedMoviesBloc extends Bloc<SearchedMoviesEvent, SearchedMoviesState> {
  final SearchMoviesUseCase searchMoviesUseCase;
  SearchedMoviesBloc(this.searchMoviesUseCase) : super(SearchedMoviesInitial()) {
    on<OnSearchedMovies>((event, emit) async {
      emit(SearchedMoviesLoading());
      var result = await searchMoviesUseCase.call(event.query);
      result.fold(
        (l) => emit(SearchedMoviesError(l.message)),
        (r) => emit(SearchedMoviesLoaded(r)),
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) {
    return events.debounceTime(duration).flatMap(mapper);
  };
}
