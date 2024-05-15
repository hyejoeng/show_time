class MovieModel {
  final List<int> genreIds;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int star;

  MovieModel({required this.genreIds, required this.posterPath, required this.releaseDate, required this.title, required this.voteAverage, required this.star});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final posterPath = 'https://image.tmdb.org/t/p/original/${json['poster_path']}';
    final voteAverage = json['vote_average'].toStringAsFixed(1);
    final star = json['vote_average'] ~/ 2;

    final List<int> genreIds = [];
    for (var id in json['genre_ids']) {
      genreIds.add(id);
    }

    return MovieModel(
      genreIds: genreIds,
      posterPath: posterPath,
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: voteAverage,
      star: star,
    );
  }
}