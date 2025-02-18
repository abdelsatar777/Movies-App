import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movies_app/models/movies_model.dart';

class CustomCard extends StatelessWidget {
  final TrendingMoviesModel trendingMoviesModel;

  const CustomCard({super.key, required this.trendingMoviesModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            "https://image.tmdb.org/t/p/w500${trendingMoviesModel.image}",
            width: 300,
            height: 400,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/img/Default Movie.jpg',
                fit: BoxFit.cover,
                width: 300,
                height: 400,
              );
            },
          ),
        ),
        Positioned(
          bottom: 24,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    trendingMoviesModel.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // يجعل الحجم ديناميكيًا
                  children: [
                    Text(
                      "IMDb",
                      style: TextStyle(
                        fontSize: 10,
                        letterSpacing: 1,
                        color: Colors.white70,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      // يجعل الـ Row يأخذ حجم محتوياته فقط
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellowAccent,
                          size: 24,
                        ),
                        SizedBox(width: 8),
                        Text(
                          trendingMoviesModel.rate,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
