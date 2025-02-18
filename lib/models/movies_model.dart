class MoviesModel {
  final String title;
  final String date;
  final String rate;
  final String image;

  MoviesModel(
      {required this.title,
      this.date = "",
      required this.image,
      this.rate = "0.0"});
}

class TrendingMoviesModel {
  final String title;
  final String rate;
  final String image;

  TrendingMoviesModel(
      {required this.title, required this.image, required this.rate});
}
