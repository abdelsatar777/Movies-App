import 'package:flutter/material.dart';

import '../../utils/colors.dart';


class MovieSynopsis extends StatelessWidget {
  final String overview;

  const MovieSynopsis({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Synopsis", style: TextStyle(fontSize: 20, color: Colors.white)),
        SizedBox(height: 10),
        Text(overview,
            style: TextStyle(fontSize: 15, color: AppColors.detailsTextColor)),
      ],
    );
  }
}
