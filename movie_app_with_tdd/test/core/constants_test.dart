import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app_with_tdd/core/constants/constants.dart';

void main() {
  const testQuery = "batman.jpg";
  const testPath = "https://image.tmdb.org/t/p/w500/batman.jpg";
  group("Constants movie poster method", () {
    test("should return the correct path", () {
      // act
      final result = Urls.moviePoster(testQuery);

      // assert
      expect(result, testPath);
    });
  });
}
