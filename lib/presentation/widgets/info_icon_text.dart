import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class InfoIconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoIconText({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.detailsTextColor, size: 20),
        SizedBox(width: 5),
        Text(text,
            style: TextStyle(fontSize: 14, color: AppColors.detailsTextColor)),
      ],
    );
  }
}
