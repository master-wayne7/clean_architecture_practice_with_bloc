import 'package:flutter/material.dart';
import 'package:movie_app_with_tdd/core/constants/constants.dart';
import 'package:movie_app_with_tdd/core/utility/methods.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;
  final String tag;
  const MovieDetailsScreen({super.key, required this.movie, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: Hero(
                    tag: movie.id.toString() + tag,
                    child: Image.network(
                      Urls.moviePoster(movie.posterPath),
                      fit: BoxFit.fill,
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
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 235,
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        movie.voteAverage.toStringAsPrecision(3),
                        style: const TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                        size: 15,
                      ),
                      Text(
                        "(${formatNumber(movie.voteCount)})",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Released on:  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        movie.releaseDate,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Popularity:  ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${movie.popularity.toStringAsPrecision(4)}%",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      movie.popularity > 100
                          ? const Icon(
                              Icons.keyboard_arrow_up_rounded,
                              color: Colors.green,
                              size: 20,
                            )
                          : const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.red,
                              size: 20,
                            )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Plot:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    movie.overview,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
