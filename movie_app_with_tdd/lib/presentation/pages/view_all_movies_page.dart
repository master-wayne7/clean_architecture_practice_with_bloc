import 'package:flutter/material.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';
import 'package:movie_app_with_tdd/presentation/widgets/movie_card.dart';

class ViewAllMoviesPage extends StatelessWidget {
  final List<Movie> movies;
  final String tag;
  const ViewAllMoviesPage({super.key, required this.movies, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'All Movies',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.68),
          shrinkWrap: true,
          itemCount: movies.length,
          itemBuilder: (context, index) => MovieCard(
            movie: movies[index],
            tag: tag,
          ),
        ),
      ),
    );
  }
}
