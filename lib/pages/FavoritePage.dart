import 'package:flutter/material.dart';
import 'package:projectmobile/fetching/fetching_api.dart';
import 'package:projectmobile/model/data_favorite.dart';
import 'package:projectmobile/widgets/CustomNavBar.dart';

class FavoritePage extends StatelessWidget {
  final FetchingAPI fetching = FetchingAPI();

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
                      "Favorite Movie",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Tambahkan teks di bawah "Favorite Movie"
                    Text(
                      "This Your Favorite Movie, Would You Like to Watch It?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder<List<dynamic>>(
                  future: fetching.fetchDataFavorite(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<Favorite> movies = snapshot.data;

                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(10),
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
                                          movies[index].gambar,
                                          height: 120,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          // Tindakan saat tombol favorit ditekan
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Text(
                                      movies[index].judul,
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
                          );
                        },
                      );
                    } else {
                      return Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
