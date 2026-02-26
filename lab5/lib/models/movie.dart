class Movie {
  final String title;
  final String rating;
  final String genres;
  final String overview;
  final String posterUrl;
  final List<String> trailers;
  bool isFavorite;

  Movie({
    required this.title,
    required this.rating,
    required this.genres,
    required this.overview,
    required this.posterUrl,
    required this.trailers,
    this.isFavorite = false,
  });
}