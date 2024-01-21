import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';
import 'package:movie_app_with_tdd/domain/use_cases/get_popular_movies_use_case.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late GetPopularMoviesUseCase getPopularMoviesUseCase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    getPopularMoviesUseCase = GetPopularMoviesUseCase(movieRepository: mockMovieRepository);
  });

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
  ];

  group("Get Popular Movie Use Case", () {
    test("should return a list of popular movies", () async {
      // arrange
      when(mockMovieRepository.getPopularMovies()).thenAnswer((_) async => Right(testMovieList));
      // act
      final result = await getPopularMoviesUseCase();
      // assert
      expect(result, Right(testMovieList));
      verify(mockMovieRepository.getPopularMovies());
      verifyNoMoreInteractions(mockMovieRepository);
    });
  });
}
