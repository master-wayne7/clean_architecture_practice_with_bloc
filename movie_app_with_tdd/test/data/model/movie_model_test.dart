import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app_with_tdd/data/models/movie_model.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';

import '../../helper/json_reader.dart';

void main() {
  const movieModel = MovieModel(
    id: 1,
    title: "Sample Movie",
    overview: "Overview here",
    posterPath: "/path2.jpg",
    adult: false,
    backdropPath: '/path.jpg',
    originalLanguage: 'en',
    originalTitle: 'Sample Movie',
    mediaType: 'movie',
    releaseDate: '2020-01-01',
    popularity: 100.0,
    voteAverage: 7.5,
    voteCount: 100,
  );

  group(
    "movie model",
    () {
      test(
        "should be a sub class of movie entity",
        () async {
          // assert
          expect(movieModel, isA<Movie>());
        },
      );
      test(
        "should return a valid model from json",
        () async {
          // arrange
          final Map<String, dynamic> jsonMap = jsonDecode(readJson('/helper/dummy/dummy_movie_data.json'));

          // act
          final result = MovieModel.fromJson(jsonMap);

          // assert
          expect(result, movieModel);
        },
      );
    },
  );
}
