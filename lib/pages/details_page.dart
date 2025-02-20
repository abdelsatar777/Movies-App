import 'package:flutter/material.dart';
import 'package:movies_app/models/movies_model.dart';
import 'package:movies_app/presentation/widgets/custom_recommendations_card.dart';
import 'package:movies_app/utils/colors.dart';
import '../presentation/widgets/movie_details_card.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<MoviesModel> recommendations = [
    MoviesModel(
        title: "Test", date: "2024-", image: "assets/img/Default Movie.jpg"),
    MoviesModel(
        title: "Test", date: "2024-", image: "assets/img/Default Movie.jpg"),
    MoviesModel(
        title: "Test", date: "2024-", image: "assets/img/Default Movie.jpg"),
    MoviesModel(
        title: "Test", date: "2024-", image: "assets/img/Default Movie.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MovieDetailsCard(),
          Padding(
            padding: EdgeInsets.only(
              top: 30,
              right: 30,
              left: 30,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Star Wars: The Last Jedi",
                      style: TextStyle(fontSize: 26, color: Colors.white),
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
                        "4K",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_time_outlined,
                          color: AppColors.detailsTextColor,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "152 minutes",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.detailsTextColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.detailsTextColor,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "7.0 (IMDb)",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.detailsTextColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Divider(color: Color(0xff515151), height: 0.7),
                SizedBox(height: 18),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Release date",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "December 9, 2017",
                          style: TextStyle(
                              fontSize: 16, color: AppColors.detailsTextColor),
                        ),
                      ],
                    ),
                    SizedBox(width: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Genre",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        //List
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey[800],
                          ),
                          child: Text(
                            "Action",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Divider(color: Color(0xff515151), height: 0.7),
                SizedBox(height: 18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Synopsis",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Rey (Daisy Riley) finally manages to find the legendary Jedi knight, Luke Skywalker (Mark Hamill) on an island with a magical aura. The heroes of The Force Awakens including Leia, Finn ",
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.detailsTextColor,
                            ),
                          ),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Read more..",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recommendations",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 180, // تحديد ارتفاع مناسب لعرض الكروت
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: recommendations.length,
                        itemBuilder: (context, index) {
                          return CustomSimilarCard(
                              moviesModel: recommendations[index]);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
