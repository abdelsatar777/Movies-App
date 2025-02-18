import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/cubit.dart';
import '../../manager/state.dart';
import 'custom_card.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMoviesCubit, AppState>(
      builder: (context, state) {
        if (state is SuccessStateTrendingMovies) {
          return Scaffold(
            body: CarouselSlider.builder(
              itemCount: state.trendingMovies.length,
              options: CarouselOptions(
                height: 400,
                // ارتفاع السلايدر
                autoPlay: true,
                // تشغيل تلقائي
                enlargeCenterPage: true,
                // تكبير العنصر في المنتصف
                aspectRatio: 16 / 9,
                // نسبة الأبعاد
                viewportFraction: 0.8, // نسبة حجم العنصر بالنسبة للشاشة
              ),
              itemBuilder: (context, index, realIndex) => CustomCard(
                trendingMoviesModel: state.trendingMovies[index],
              ),
            ),
          );
        } else if (state is ErrorState) {
          return Text("Error: ${state.errorMassage}");
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.redAccent,
            ),
          );
        }
      },
    );
  }
}
