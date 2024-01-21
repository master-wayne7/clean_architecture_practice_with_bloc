import 'package:flutter/material.dart';
import 'package:movie_app_with_tdd/domain/entities/movie.dart';
import 'package:movie_app_with_tdd/presentation/widgets/movie_card.dart';

class MoviesGrid extends StatelessWidget {
  final VoidCallback onTap;
  final List<Movie> movies;
  final String tag;

  const MoviesGrid({Key? key, required this.movies, required this.onTap, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.68),
      itemBuilder: (context, index) {
        if (index == 3) {
          return GestureDetector(
            onTap: () {
              debugPrint("");
              onTap.call();
            },
            child: Card(
              elevation: 2,
              margin: const EdgeInsets.all(5),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SizedBox(
                height: 200,
                width: 200,
                child: ColoredBox(
                  color: Colors.grey[850]!,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "View All",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return MovieCard(
            movie: movies[index],
            tag: tag,
          );
        }
      },
    );
  }
}
