import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/manager/cubit.dart';
import 'package:movies_app/manager/state.dart';
import '../presentation/widgets/movie_details_card.dart';
import '../presentation/widgets/movie_details_section.dart';
import '../presentation/widgets/movie_info_row.dart';
import '../presentation/widgets/movie_synopsis.dart';
import '../presentation/widgets/movie_title_section.dart';
import '../presentation/widgets/related_movies_list.dart';

class DetailsPage extends StatefulWidget {
  final String movieId;

  const DetailsPage({super.key, required this.movieId});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<MoviesDetailsCubit>().getMoviesDetails(id: widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsCubit, AppState>(
      builder: (context, state) {
        if (state is SuccessStateMoviesDetails) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  MovieDetailsCard(
                    imgPath: state.details.image,
                    url: state.details.url,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    child: Column(
                      children: [
                        MovieTitleSection(
                            title: state.details.title,
                            views: state.details.views),
                        SizedBox(height: 12),
                        MovieInfoRow(
                            time: state.details.time, rate: state.details.rate),
                        SizedBox(height: 18),
                        Divider(color: Color(0xff515151), height: 0.7),
                        SizedBox(height: 18),
                        MovieDetailsSection(
                            date: state.details.date,
                            genre: state.details.genre),
                        SizedBox(height: 18),
                        Divider(color: Color(0xff515151), height: 0.7),
                        SizedBox(height: 18),
                        MovieSynopsis(overview: state.details.overView),
                        SizedBox(height: 20),
                        RelatedMoviesList(movies: state.details.similar),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is ErrorState) {
          return Scaffold(
            body: Center(child: Text("Error: ${state.errorMassage}")),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Colors.redAccent),
            ),
          );
        }
      },
    );
  }
}
