import 'package:flutter/material.dart';
import 'package:movie_app_with_tdd/core/constants/constants.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';
import 'package:movie_app_with_tdd/presentation/pages/movie_details_screen.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie, required this.tag});
  final Movie movie;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailsScreen(
            movie: movie,
            tag: tag,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            elevation: 2,
            margin: const EdgeInsets.all(5),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              height: 200,
              width: 200,
              child: Stack(
                children: [
                  Hero(
                    tag: movie.id.toString() + tag,
                    child: Material(
                      child: Ink.image(
                        image: NetworkImage(Urls.moviePoster(movie.posterPath)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (movie.adult)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Image.asset(
                        "assets/images/18+.png",
                        height: 20,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    movie.title,
                    style: const TextStyle(color: Colors.white, height: 0.9),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Text(
                      movie.voteAverage.toStringAsPrecision(3),
                      style: const TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Released on: ${movie.releaseDate.replaceAll("-", "/")}",
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
