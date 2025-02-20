import 'package:flutter/material.dart';

class GenresCard extends StatelessWidget {
  final String title;

  const GenresCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white54),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[800],
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    );
  }
}
