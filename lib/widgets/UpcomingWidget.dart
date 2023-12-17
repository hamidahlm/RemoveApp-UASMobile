import 'package:flutter/material.dart';
import 'package:projectmobile/model/data_movie.dart';
import 'package:projectmobile/pages/MoviePage.dart';

class UpcomingWidget extends StatelessWidget {
 final  List<Movie> upcomingMovies;

  UpcomingWidget({required this.upcomingMovies});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // menampilkan judul dari menu
                "Upcoming Movies",
                style: TextStyle(
                  color: Color(0xFF292B37),
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  color: Color(0xFF292B37),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        SingleChildScrollView(
          // untuk menampilkan gambar film
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < upcomingMovies.length; i++)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MoviePage(movie: upcomingMovies[i]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        upcomingMovies[i].gambar,
                        height: 180,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
