import 'package:flutter/material.dart';


class MovieTitleSection extends StatelessWidget {
  final String title;
  final String views;

  const MovieTitleSection({super.key, required this.title, required this.views});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 26, color: Colors.white),
            softWrap: true,
          ),
        ),
        SizedBox(width: 12),
        Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white54),
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[800],
          ),
          child: Text(
            "${views.substring(0, 1)}K",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
