import 'package:flutter/material.dart';
import 'info_icon_text.dart';

class MovieInfoRow extends StatelessWidget {
  final String time;
  final String rate;

  const MovieInfoRow({required this.time, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InfoIconText(icon: Icons.access_time_outlined, text: "$time minutes"),
        SizedBox(width: 12),
        InfoIconText(icon: Icons.star, text: "$rate (IMDb)"),
      ],
    );
  }
}
