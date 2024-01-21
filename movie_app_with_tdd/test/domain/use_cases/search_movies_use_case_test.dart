import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';
import 'package:movie_app_with_tdd/domain/use_cases/search_movie_use_case.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late SearchMoviesUseCase searchMoviesUseCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    searchMoviesUseCase = SearchMoviesUseCase(movieRepository: mockMovieRepository);
  });

  const testSearch = "Batman";

  final List<Movie> testMovieList = [
    const Movie(
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
    const Movie(
      id: 2,
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

  group("Search Movie Use Case", () {
    test("should return a list of trending movies", () async {
      // arrange
      when(mockMovieRepository.searchMovies(testSearch)).thenAnswer((_) async => Right(testMovieList));
      // act
      final result = await searchMoviesUseCase(testSearch);
      // assert
      expect(result, Right(testMovieList));
      verify(mockMovieRepository.searchMovies(testSearch));
      verifyNoMoreInteractions(mockMovieRepository);
    });
  });
}
