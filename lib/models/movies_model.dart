class MoviesModel {
  final String title;
  final String date;
  final String image;

  MoviesModel({
    required this.title,
    required this.date,
    required this.image,
  });
}

class TrendingMoviesModel {
  final String title;
  final String rate;
  final String image;

  TrendingMoviesModel({
    required this.title,
    required this.image,
    required this.rate,
  });
}
