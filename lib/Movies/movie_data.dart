class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final List<int> genreIds;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.genreIds,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'],
    title: json['title'],
    overview: json['overview'],
    posterPath: json['poster_path'],
    voteAverage: json['vote_average'].toDouble(),
    genreIds: List<int>.from(json['genre_ids'] ?? []),
  );
  }
}
