import 'package:movies_app/models/movies_model.dart';

class MoviesDetailsModel {
  final String image;
  final String url;
  final String title;
  final String views;
  final String time;
  final String rate;
  final String date;
  final String overView;
  final List<String> genre;
  final List<MoviesModel> similar;

  MoviesDetailsModel({
    required this.image,
    required this.url,
    required this.title,
    required this.views,
    required this.time,
    required this.rate,
    required this.date,
    required this.overView,
    required this.genre,
    required this.similar,
  });
}
