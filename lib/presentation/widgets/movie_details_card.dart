import 'dart:ui';
import 'package:flutter/material.dart';

class MovieDetailsCard extends StatelessWidget {
  const MovieDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // لضبط كل العناصر في المنتصف
      children: [
        Image.network(
          "assets/img/Default Movie.jpg",
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/img/Default Movie.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 400,
            );
          },
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // تأثير الظل
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1), // تأثير شفاف أسود
                  ),
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [Color(0xffEF2D1A), Color(0xffFF8F71)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 30,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 35,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
