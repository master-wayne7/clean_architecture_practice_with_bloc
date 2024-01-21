import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_with_tdd/core/error/failure.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';
import 'package:movie_app_with_tdd/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockGetPopularMoviesUseCase useCase;
  late PopularMoviesBloc bloc;

  setUp(() {
    useCase = MockGetPopularMoviesUseCase();
    bloc = PopularMoviesBloc(useCase);
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

  group("Popular Movies Bloc", () {
    test("should have an initial state as [PopularMoviesInitial]", () {
      expect(bloc.state, PopularMoviesInitial());
    });

    blocTest(
      "emits [PopularMoviesLoading,PopularMoviesLoaded] when data is fetched succesfully",
      build: () {
        when(useCase.call()).thenAnswer((_) async => const Right(testMovieEntity));
        return bloc;
      },
      act: (bloc) => bloc.add(FetchPopularMovies()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        PopularMoviesLoading(),
        const PopularMoviesLoaded(testMovieEntity),
      ],
    );
    blocTest(
      "emits [PopularMoviesLoading,PopularMoviesError] when data is not fetched succesfully",
      build: () {
        when(useCase.call()).thenAnswer((_) async => const Left(ServerFailure("Server Error")));
        return bloc;
      },
      act: (bloc) => bloc.add(FetchPopularMovies()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        PopularMoviesLoading(),
        const PopularMoviesError("Server Error"),
      ],
    );
  });
}
