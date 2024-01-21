import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_with_tdd/data/data_sources/remote/movie_remote_data_source_impl.dart';
import 'package:movie_app_with_tdd/data/data_sources/remote_data_source.dart';
import 'package:movie_app_with_tdd/data/repositories/movie_repository_impl.dart';
import 'package:movie_app_with_tdd/domain/repositories/movie_repository.dart';
import 'package:movie_app_with_tdd/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movie_app_with_tdd/domain/use_cases/get_trending_movies_use_case.dart';
import 'package:movie_app_with_tdd/domain/use_cases/search_movie_use_case.dart';
import 'package:movie_app_with_tdd/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:movie_app_with_tdd/presentation/bloc/searched_movies_bloc/searched_movies_bloc.dart';
import 'package:movie_app_with_tdd/presentation/bloc/trending_movies_bloc/trending_movies_bloc.dart';

final sl = GetIt.instance;

void init() {
  // bloc
  sl.registerFactory<TrendingMoviesBloc>(() => TrendingMoviesBloc(sl()));
  sl.registerFactory<PopularMoviesBloc>(() => PopularMoviesBloc(sl()));
  sl.registerFactory<SearchedMoviesBloc>(() => SearchedMoviesBloc(sl()));

  // usecases
  sl.registerLazySingleton(() => GetTrendingMoviesUseCase(movieRepository: sl()));
  sl.registerLazySingleton(() => GetPopularMoviesUseCase(movieRepository: sl()));
  sl.registerLazySingleton(() => SearchMoviesUseCase(movieRepository: sl()));

  // repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(movieRemoteDataSource: sl()));

  // dataSource
  sl.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(httpClient: sl()));

  // http client
  sl.registerLazySingleton(() => http.Client());
}
