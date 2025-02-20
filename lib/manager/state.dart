import 'package:movies_app/models/movies_details_model.dart';
import 'package:movies_app/models/movies_model.dart';
import '../models/trending_movies_model.dart';

abstract class AppState {}

class InitialState extends AppState {}

class LoadingState extends AppState {}

class SuccessStateMovies extends AppState {
  final List<MoviesModel> movies;

  SuccessStateMovies({required this.movies});
}

class SuccessStateTrendingMovies extends AppState {
  final List<TrendingMoviesModel> trendingMovies;

  SuccessStateTrendingMovies({required this.trendingMovies});
}

class SuccessStateMoviesDetails extends AppState {
  final MoviesDetailsModel details;

  SuccessStateMoviesDetails({required this.details});
}

class ErrorState extends AppState {
  final String errorMassage;

  ErrorState({required this.errorMassage});
}
