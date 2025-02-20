import 'package:flutter/material.dart';

import 'custom_similar_card.dart';



class RelatedMoviesList extends StatelessWidget {
  final List movies;

  const RelatedMoviesList({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Related Movies",
            style: TextStyle(fontSize: 20, color: Colors.white)),
        SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return CustomSimilarCard(moviesModel: movies[index]);
            },
          ),
        ),
      ],
    );
  }
}
