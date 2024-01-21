import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_with_tdd/core/error/failure.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';
import 'package:movie_app_with_tdd/presentation/bloc/searched_movies_bloc/searched_movies_bloc.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockSearchMoviesUseCase useCase;
  late SearchedMoviesBloc bloc;

  setUp(() {
    useCase = MockSearchMoviesUseCase();
    bloc = SearchedMoviesBloc(useCase);
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
  const testMovie = "Batman";

  group("Searched Movies Bloc", () {
    test("should have an initial state as [SearchedMoviesInitial]", () {
      expect(bloc.state, SearchedMoviesInitial());
    });

    blocTest(
      "emits [SearchedMoviesLoading,SearchedMoviesLoaded] when data is fetched succesfully",
      build: () {
        when(useCase.call(testMovie)).thenAnswer((_) async => const Right(testMovieEntity));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnSearchedMovies(testMovie)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchedMoviesLoading(),
        const SearchedMoviesLoaded(testMovieEntity),
      ],
    );
    blocTest(
      "emits [SearchedMoviesLoading,SearchedMoviesError] when data is not fetched succesfully",
      build: () {
        when(useCase.call(testMovie)).thenAnswer((_) async => const Left(ServerFailure("Server Error")));
        return bloc;
      },
      act: (bloc) => bloc.add(const OnSearchedMovies(testMovie)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchedMoviesLoading(),
        const SearchedMoviesError("Server Error"),
      ],
    );
  });
}
