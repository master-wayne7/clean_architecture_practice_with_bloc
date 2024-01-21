import 'dart:convert';

import 'package:movie_app_with_tdd/core/constants/constants.dart';
import 'package:movie_app_with_tdd/core/error/exceptions.dart';
import 'package:movie_app_with_tdd/data/data_sources/remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_with_tdd/data/models/movie_model.dart';

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final http.Client httpClient;
  MovieRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await httpClient.get(Uri.parse("${Urls.baseUrl}/movie/popular?language=en-US&page=1&api_key=${Urls.apiKey}"));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List).map((movie) => MovieModel.fromJson(movie)).toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await httpClient.get(Uri.parse("${Urls.baseUrl}/trending/movie/day?language=en-US&page=1&api_key=${Urls.apiKey}"));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List).map((movie) => MovieModel.fromJson(movie)).toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await httpClient.get(Uri.parse("${Urls.baseUrl}/search/movie?query=$query&language=en-US&page=1&api_key=${Urls.apiKey}"));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List).map((movie) => MovieModel.fromJson(movie)).toList();
      return movies;
    } else {
      throw ServerException();
    }
  }
}
