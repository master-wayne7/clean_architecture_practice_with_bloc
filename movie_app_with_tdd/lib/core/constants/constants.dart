class Urls {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '9f1ebfb60f6a6b25f94237b294e91ebb';
  static String moviePoster(String posterPath) => 'https://image.tmdb.org/t/p/w500/$posterPath';
}
