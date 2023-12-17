import 'package:flutter/material.dart';
import 'package:projectmobile/fetching/fetching_api.dart';
import 'package:projectmobile/model/data_movie.dart';
import 'package:projectmobile/widgets/CustomNavBar.dart';
import 'package:projectmobile/widgets/NewMoviesWidget.dart';
import 'package:projectmobile/widgets/UpcomingWidget.dart';

class HomePage extends StatelessWidget {
  final FetchingAPI fetching = FetchingAPI();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetching.fetchDataMovies(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Movie> movies = snapshot.data;

          final upcomingMovies =
              movies.where((item) => item.status == "upcomingmovies").toList();
          final newMovies =
              movies.where((item) => item.status == "newmovies").toList();

          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // untuk menampilkan teks
                                "REMOVE",
                                style: TextStyle(
                                  color: Color(0xFF292B37),
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                // untuk menampilkan teks
                                "What you Want to Know?",
                                style: TextStyle(
                                  color: Color(0xFF292B37),
                                ),
                              ),
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              // untuk menampilkan foto profile
                              "images/profile.jpg",
                              height: 60,
                              width: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    UpcomingWidget(upcomingMovies: upcomingMovies),
                    SizedBox(height: 40),
                    NewMoviesWidget(newMovies: newMovies),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: CustomNavBar(),
          );
        } else {
          return Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
