import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_with_tdd/data/data_sources/remote_data_source.dart';
import 'package:movie_app_with_tdd/domain/repositories/movie_repository.dart';
import 'package:movie_app_with_tdd/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movie_app_with_tdd/domain/use_cases/get_trending_movies_use_case.dart';
import 'package:movie_app_with_tdd/domain/use_cases/search_movie_use_case.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  GetTrendingMoviesUseCase,
  GetPopularMoviesUseCase,
  SearchMoviesUseCase,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
