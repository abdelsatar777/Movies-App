import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/manager/state.dart';
import 'package:movies_app/models/movies_model.dart';
import 'package:movies_app/network/api_service.dart';

class MoviesCubit extends Cubit<AppState> {
  MoviesCubit() : super(InitialState());
  ApiService apiService = ApiService();

  getMovies() async {
    List<MoviesModel> movies = [];
    emit(LoadingState());
    try {
      for (int count = 1; count <= 10; count++) {
        var data = await apiService.get(
            endPoint:
                "movie/popular?api_key=c217c2ceb96deb7de1b913eee12d55c8&language=en-US&page=$count");
        for (var i in data["results"]) {
          movies.add(
            MoviesModel(
              title: i["original_title"] ?? "No Title",
              date: i["release_date"] ?? "No Date",
              image: i["poster_path"] ?? "No Image",
            ),
          );
        }
      }
      emit(SuccessStateMovies(movies: movies));
    } catch (error) {
      emit(ErrorState(errorMassage: error.toString()));
    }
  }
}

class TrendingMoviesCubit extends Cubit<AppState> {
  TrendingMoviesCubit() : super(InitialState());
  ApiService apiService = ApiService();

  getTrendingMovies() async {
    List<TrendingMoviesModel> trendingMovies = [];
    emit(LoadingState());
    try {
      for (int count = 1; count <= 7; count++) {
        var data = await apiService.get(
            endPoint:
                "trending/movie/day?api_key=c217c2ceb96deb7de1b913eee12d55c8&language=en-US&page=$count");
        for (var i in data["results"]) {
          trendingMovies.add(
            TrendingMoviesModel(
              title: i["original_title"] ?? "No Title",
              rate: i["vote_average"].toString(),
              image: i["poster_path"] ?? "No Image",
            ),
          );
        }
      }
      emit(SuccessStateTrendingMovies(trendingMovies: trendingMovies));
    } catch (error) {
      emit(ErrorState(errorMassage: error.toString()));
    }
  }
}
