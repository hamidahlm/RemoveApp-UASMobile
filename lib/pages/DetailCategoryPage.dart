import 'package:flutter/material.dart';
import 'package:projectmobile/fetching/fetching_api.dart';
import 'package:projectmobile/model/data_movie.dart';
import 'package:projectmobile/pages/MoviePage.dart';
import 'package:projectmobile/widgets/CustomNavBar.dart';

class DetailCategoryPage extends StatelessWidget {
  final String category;
  final FetchingAPI fetching = FetchingAPI();

  DetailCategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // to go back to the page
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      category,
                      style: TextStyle(
                        color: Color(0xFF292B37),
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder<List<dynamic>>(
                future: fetching.fetchDataMovies(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Movie> movies = snapshot.data;

                    final categoryMovies =
                        movies.where((item) => item.genre == category).toList();

                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: categoryMovies.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MoviePage(movie: categoryMovies[index]),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 4,
                              color: Colors.blue[50],
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          categoryMovies[index].gambar,
                                          height: 120,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Text(
                                      categoryMovies[index].judul,
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
