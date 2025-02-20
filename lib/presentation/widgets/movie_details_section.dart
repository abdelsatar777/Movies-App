import 'package:flutter/material.dart';
import 'movie_detail_item.dart';

class MovieDetailsSection extends StatelessWidget {
  final String date;
  final List<String> genre;

  const MovieDetailsSection(
      {super.key, required this.date, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDetailItem(title: "Release date", value: date),
        SizedBox(width: 20),
        MovieDetailItem(title: "Genre", value: null, genre: genre),
      ],
    );
  }
}
