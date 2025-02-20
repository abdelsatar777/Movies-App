import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/manager/cubit.dart';
import 'package:movies_app/pages/home_page_wrapper.dart';
import 'package:movies_app/utils/colors.dart';

main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MoviesCubit()..getMovies()),
        BlocProvider(
            create: (context) => TrendingMoviesCubit()..getTrendingMovies()),
        BlocProvider(create: (context) => MoviesDetailsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: AppColors.primaryColor),
        home: HomePageWrapper(),
      ),
    );
  }
}
