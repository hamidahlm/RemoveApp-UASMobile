import 'package:flutter/material.dart';
import 'package:projectmobile/pages/DetailCategoryPage.dart';
import 'package:projectmobile/widgets/CustomNavBar.dart';

class CategoryPage extends StatelessWidget {
  final List<String> category = [
    "Action",
    "Advanture",
    "Drama",
    "Fantasy",
    "Horror",
  ];

  final List<String> cover = [
    "https://img.hurawatch.bz/i/cache/images/f/f7/f771b4140f8c116f09e00c4104d66096.jpg",
    "https://img.hurawatch.bz/i/cache/images/0/06/0636cc05476c8a36062b1b5cecfa25aa.jpg",
    "https://i.pinimg.com/564x/0f/c4/cc/0fc4cc6a5807023b4b99dbcdf6fb6605.jpg",
    "https://img.hurawatch.bz/i/cache/images/2018/04/16f0522078372d6c297cf8100c5ce72d.jpg",
    "https://img.hurawatch.bz/i/cache/images/0/0b/0b0c34f47b0d10d8528ca11325321325.jpg",
  ];

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
                      "Discover",
                      style: TextStyle(
                        color: Color(0xFF292B37),
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailCategoryPage(category: category[index])),
                        );
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    cover[index],
                                    height: 70,
                                    width: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Category ${category[index]}",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Color(0xFF292B37),
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xFF292B37),
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
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
