import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/manager/state.dart';
import 'package:movies_app/models/movies_details_model.dart';
import 'package:movies_app/models/movies_model.dart';
import 'package:movies_app/network/api_service.dart';
import '../models/trending_movies_model.dart';

class MoviesCubit extends Cubit<AppState> {
  MoviesCubit() : super(InitialState());
  ApiService apiService = ApiService();

  getMovies({required String type}) async {
    List<MoviesModel> movies = [];
    emit(LoadingState());
    try {
      for (int count = 1; count <= 10; count++) {
        var data = await apiService.get(
            endPoint:
                "$type/popular?api_key=c217c2ceb96deb7de1b913eee12d55c8&language=en-US&page=$count");
        for (var i in data["results"]) {
          movies.add(
            MoviesModel(
              id: i["id"].toString(),
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
              id: i["id"].toString(),
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

class MoviesDetailsCubit extends Cubit<AppState> {
  MoviesDetailsCubit() : super(InitialState());
  ApiService apiService = ApiService();

  getMoviesDetails({required String id}) async {
    emit(LoadingState());
    try {
      var data = await apiService.get(
          endPoint:
              "movie/$id?language=en-US&api_key=c217c2ceb96deb7de1b913eee12d55c8");

      var similarData = await apiService.get(
          endPoint:
              "movie/$id/similar?language=en-US&api_key=c217c2ceb96deb7de1b913eee12d55c8");
      List<String> genre = [];
      List<MoviesModel> similar = [];

      for (var i in data["genres"]) {
        genre.add(i["name"]);
      }
      for (var i in similarData["results"]) {
        similar.add(
          MoviesModel(
            id: i["id"].toString(),
            title: i["original_title"] ?? "No Title",
            date: i["release_date"].toString(),
            image: i["poster_path"] ?? "No Image",
          ),
        );
      }

      MoviesDetailsModel details = MoviesDetailsModel(
        image: data["backdrop_path"],
        url: data["homepage"],
        title: data["original_title"],
        views: data["popularity"].toString(),
        time: data["runtime"].toString(),
        rate: data["vote_average"].toString(),
        date: data["release_date"],
        overView: data["overview"],
        genre: genre,
        similar: similar,
      );

      emit(SuccessStateMoviesDetails(details: details));
    } catch (error) {
      emit(ErrorState(errorMassage: error.toString()));
    }
  }
}
