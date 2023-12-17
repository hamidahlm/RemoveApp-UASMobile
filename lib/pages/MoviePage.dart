import 'package:flutter/material.dart';
import 'package:projectmobile/fetching/fetching_api.dart';
import 'package:projectmobile/model/data_movie.dart';
import 'package:projectmobile/widgets/CustomNavBar.dart';
import 'package:projectmobile/widgets/CastWidget.dart';

class MoviePage extends StatefulWidget {
  final Movie movie;
  MoviePage({required this.movie});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  bool isFavorite = false;
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      isFavorite = await FetchingAPI().checkFavorite(widget.movie.judul);
      setState(() {});
    } catch (e) {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Image.network(
              widget.movie.gambar,
              height: 280,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFF292B37),
                            size: 30,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            FetchingAPI()
                                .toggleFavorite(isFavorite, widget.movie.judul, widget.movie)
                                .then((newValue) {
                              setState(() {
                                isFavorite = newValue;
                              });
                            });
                          },
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.white,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              widget.movie.gambar,
                              height: 250,
                              width: 180,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 50, top: 70),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.red,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.red.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 8,
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 60,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.movie.judul,
                          style: TextStyle(
                            color: Color(0xFF292B37),
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          widget.movie.deskripsi,
                          style: TextStyle(
                            color: Color(0xFF292B37),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  CastWidget(cast: widget.movie.casts),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
