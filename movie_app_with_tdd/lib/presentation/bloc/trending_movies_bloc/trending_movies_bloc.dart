import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';
import 'package:movie_app_with_tdd/domain/use_cases/get_trending_movies_use_case.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMoviesUseCase getTrendingMoviesUseCase;

  TrendingMoviesBloc(this.getTrendingMoviesUseCase) : super(TrendingMoviesInitial()) {
    on<FetchTrendingMovies>((event, emit) async {
      emit(TrendingMoviesLoading());
      final result = await getTrendingMoviesUseCase.call();
      result.fold(
        (l) => emit(TrendingMoviesError(l.message)),
        (r) => emit(TrendingMoviesLoaded(r)),
      );
    });
  }
}
