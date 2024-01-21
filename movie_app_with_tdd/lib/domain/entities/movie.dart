// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final bool adult;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final String mediaType;
  final String releaseDate;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  const Movie({
    required this.adult,
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.mediaType,
    required this.releaseDate,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        posterPath,
        backdropPath,
        originalLanguage,
        originalTitle,
        mediaType,
        releaseDate,
        releaseDate,
        popularity,
        voteAverage,
        voteAverage,
        voteCount,
        adult
      ];
}
