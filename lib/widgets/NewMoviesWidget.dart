import 'package:flutter/material.dart';
import 'package:projectmobile/model/data_movie.dart';
import 'package:projectmobile/pages/MoviePage.dart';

class NewMoviesWidget extends StatelessWidget {
  final List<Movie> newMovies;

  NewMoviesWidget({required this.newMovies});

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
                // judul bagian
                "New Movies",
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
        Container(
          height: 300,
          child: ListView.builder(
            // menampilkan beberapa film yang terbaru
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: ClampingScrollPhysics(),
            itemCount: newMovies.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoviePage(movie: newMovies[index]),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFF292B37),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF292B37).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.network(
                          // menampilkan gambar dari datalist
                          newMovies[index].gambar,
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // menampilkan judul dari datalist
                              newMovies[index].judul,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              // menampilkan genre dari datalist
                              newMovies[index].genre,
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  // menampilkan data dari datalist
                                  newMovies[index].rating,
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
