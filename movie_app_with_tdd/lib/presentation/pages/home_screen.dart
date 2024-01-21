import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_tdd/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:movie_app_with_tdd/presentation/bloc/trending_movies_bloc/trending_movies_bloc.dart';
import 'package:movie_app_with_tdd/presentation/pages/search_screen.dart';
import 'package:movie_app_with_tdd/presentation/pages/view_all_movies_page.dart';
import 'package:movie_app_with_tdd/presentation/widgets/movie_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Movie App',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchScreen(),
              )),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trending Movies
              const Text(
                'Trending Movies',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
                builder: (builderContext, state) {
                  if (state is TrendingMoviesLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is TrendingMoviesLoaded) {
                    return MoviesGrid(
                      movies: state.trendingMovies,
                      tag: "trending",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewAllMoviesPage(
                              movies: state.trendingMovies,
                              tag: "trending",
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is TrendingMoviesError) {
                    return Text(state.message);
                  }
                  return Container();
                },
              ),

              const SizedBox(
                height: 20,
              ),
              // Popular Movies
              const Text(
                'Popular Movies',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                builder: (context, state) {
                  if (state is PopularMoviesLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is PopularMoviesLoaded) {
                    return MoviesGrid(
                        movies: state.popularMovies,
                        tag: "popular",
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewAllMoviesPage(
                                  movies: state.popularMovies,
                                  tag: "popular",
                                ),
                              ),
                            ));
                  } else if (state is PopularMoviesError) {
                    return Text(state.message);
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
