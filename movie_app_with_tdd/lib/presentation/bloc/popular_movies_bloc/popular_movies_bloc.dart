import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';
import 'package:movie_app_with_tdd/domain/use_cases/get_popular_movies_use_case.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  PopularMoviesBloc(this.getPopularMoviesUseCase) : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(PopularMoviesLoading());
      final result = await getPopularMoviesUseCase.call();
      result.fold(
        (l) => emit(PopularMoviesError(l.message)),
        (r) => emit(PopularMoviesLoaded(r)),
      );
    });
  }
}
