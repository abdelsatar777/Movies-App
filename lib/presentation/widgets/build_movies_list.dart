import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/cubit.dart';
import '../../manager/state.dart';
import 'custom_movie_card.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => MoviesListState();
}

class MoviesListState extends State<MoviesList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, AppState>(
      builder: (context, state) {
        if (state is SuccessStateMovies) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // تجعل العنصرين بجانب بعض
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7, // التحكم في حجم الكروت
            ),
            itemCount: state.movies.length,
            itemBuilder: (context, index) {
              return CustomMovieCard(
                moviesModel: state.movies[index],
              );
            },
          );
        } else if (state is ErrorState) {
          return Text("Error: ${state.errorMassage}");
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.redAccent,
          ));
        }
      },
    );
  }
}
