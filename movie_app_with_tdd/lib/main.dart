import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_tdd/injection_container.dart';
import 'package:movie_app_with_tdd/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:movie_app_with_tdd/presentation/bloc/searched_movies_bloc/searched_movies_bloc.dart';
import 'package:movie_app_with_tdd/presentation/bloc/trending_movies_bloc/trending_movies_bloc.dart';
import 'package:movie_app_with_tdd/presentation/pages/home_screen.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<PopularMoviesBloc>()..add(FetchPopularMovies()),
        ),
        BlocProvider(
          create: (context) => sl<TrendingMoviesBloc>()..add(FetchTrendingMovies()),
        ),
        BlocProvider(
          create: (context) => sl<SearchedMoviesBloc>(),
        ),
      ],
      child: const MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
