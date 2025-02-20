import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/movies_model.dart';

import '../../manager/cubit.dart';
import '../../pages/details_page.dart';

class CustomMovieCard extends StatelessWidget {
  final MoviesModel moviesModel;

  const CustomMovieCard({super.key, required this.moviesModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: context.read<MoviesDetailsCubit>(),
              child: DetailsPage(movieId: moviesModel.id),
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${moviesModel.image}",
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/img/Default Movie.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  moviesModel.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Text(
                "(${moviesModel.date.split('-')[0]})", // استخراج السنة فقط
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
