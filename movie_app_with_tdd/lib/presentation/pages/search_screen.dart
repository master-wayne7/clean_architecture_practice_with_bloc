import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_tdd/presentation/bloc/searched_movies_bloc/searched_movies_bloc.dart';
import 'package:movie_app_with_tdd/presentation/widgets/movie_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchedMoviesBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: TextField(
          onChanged: (query) => searchBloc.add(OnSearchedMovies(query)),
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          decoration: const InputDecoration(
            focusColor: Colors.white,
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            hintText: "Search a movie",
            hintStyle: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
      body: BlocBuilder<SearchedMoviesBloc, SearchedMoviesState>(
        builder: (context, state) {
          if (state is SearchedMoviesLoaded) {
            final movies = state.searchedMovies;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.68),
              shrinkWrap: true,
              itemCount: movies.length,
              itemBuilder: (context, index) => MovieCard(
                movie: movies[index],
                tag: "search",
              ),
            );
          } else if (state is SearchedMoviesError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
