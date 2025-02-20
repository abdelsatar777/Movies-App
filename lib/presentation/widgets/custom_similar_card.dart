import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/movies_model.dart';

import '../../manager/cubit.dart';
import '../../pages/details_page.dart';

class CustomSimilarCard extends StatelessWidget {
  final MoviesModel moviesModel;

  const CustomSimilarCard({super.key, required this.moviesModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: context.read<MoviesDetailsCubit>(),
              child: DetailsPage(movieId: moviesModel.id),
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${moviesModel.image}",
                fit: BoxFit.cover,
                width: 150,
                height: 120, // ارتفاع ثابت للصورة
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/img/Default Movie.jpg',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 120,
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    moviesModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "(${moviesModel.date.split('-')[0]})",
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
