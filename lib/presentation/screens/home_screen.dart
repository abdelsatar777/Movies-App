import 'package:flutter/material.dart';
import '../widgets/continue_watching_card.dart';
import '../widgets/custom_carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Stream ",
                    style: TextStyle(fontSize: 26, color: Colors.redAccent)),
                Text("Everywhere",
                    style: TextStyle(fontSize: 26, color: Colors.white))
              ],
            ),
            ContinueWatchingCard(),
            Text("Trending",
                style: TextStyle(fontSize: 24, color: Colors.white)),
            SizedBox(height: 400, child: CustomCarouselSlider()),
          ],
        ),
      ),
    );
  }
}
