import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_with_tdd/core/error/failure.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';
import 'package:movie_app_with_tdd/presentation/bloc/trending_movies_bloc/trending_movies_bloc.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockGetTrendingMoviesUseCase useCase;
  late TrendingMoviesBloc bloc;

  setUp(() {
    useCase = MockGetTrendingMoviesUseCase();
    bloc = TrendingMoviesBloc(useCase);
  });
  const testMovieEntity = [
    Movie(
      id: 1,
      title: "title",
      overview: "overview",
      posterPath: "posterPath",
      adult: false,
      backdropPath: '',
      originalLanguage: '',
      originalTitle: '',
      mediaType: '',
      releaseDate: '',
      popularity: 0,
      voteAverage: 0,
      voteCount: 0,
    ),
  ];

  group("Trending Movies Bloc", () {
    test("should have an initial state as [TrendingMoviesInitial]", () {
      expect(bloc.state, TrendingMoviesInitial());
    });

    blocTest(
      "emits [TrendingMoviesLoading,TrendingMoviesLoaded] when data is fetched succesfully",
      build: () {
        when(useCase.call()).thenAnswer((_) async => const Right(testMovieEntity));
        return bloc;
      },
      act: (bloc) => bloc.add(FetchTrendingMovies()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TrendingMoviesLoading(),
        const TrendingMoviesLoaded(testMovieEntity),
      ],
    );
    blocTest(
      "emits [TrendingMoviesLoading,TrendingMoviesError] when data is not fetched succesfully",
      build: () {
        when(useCase.call()).thenAnswer((_) async => const Left(ServerFailure("Server Error")));
        return bloc;
      },
      act: (bloc) => bloc.add(FetchTrendingMovies()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        TrendingMoviesLoading(),
        const TrendingMoviesError("Server Error"),
      ],
    );
  });
}
