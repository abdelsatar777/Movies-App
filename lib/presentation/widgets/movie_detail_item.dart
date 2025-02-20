import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'genres_card.dart';


class MovieDetailItem extends StatelessWidget {
  final String title;
  final String? value;
  final List<String>? genre;

  const MovieDetailItem({super.key, required this.title, this.value, this.genre});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
          SizedBox(height: 8),
          genre == null
              ? Text(value!,
              style: TextStyle(
                  fontSize: 16, color: AppColors.detailsTextColor))
              : Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: genre!.map((g) => GenresCard(title: g)).toList(),
          ),
        ],
      ),
    );
  }
}
