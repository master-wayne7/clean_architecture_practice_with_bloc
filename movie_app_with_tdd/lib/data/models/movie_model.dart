import 'package:movie_app_with_tdd/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required bool adult,
    required int id,
    required String title,
    required String overview,
    required String posterPath,
    required String backdropPath,
    required String originalLanguage,
    required String originalTitle,
    required String mediaType,
    required String releaseDate,
    required double popularity,
    required double voteAverage,
    required int voteCount,
  }) : super(
          adult: adult,
          id: id,
          overview: overview,
          posterPath: posterPath,
          title: title,
          backdropPath: backdropPath,
          mediaType: mediaType,
          originalTitle: originalTitle,
          originalLanguage: originalLanguage,
          popularity: popularity,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String? ?? '',
      backdropPath: json['backdrop_path'] as String? ?? '',
      originalLanguage: json['original_language'] as String? ?? '',
      originalTitle: json['original_title'] as String? ?? '',
      mediaType: json['media_type'] as String? ?? '',
      releaseDate: json['release_date'] as String? ?? '',
      popularity: json['popularity'] as double? ?? 0.0,
      voteAverage: json['vote_average'] as double? ?? 0.0,
      voteCount: json['vote_count'] as int? ?? 0,
      adult: json['adult'] as bool? ?? false,
    );
  }

  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      adult: adult,
      backdropPath: backdropPath,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      mediaType: mediaType,
      releaseDate: releaseDate,
      popularity: popularity,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
