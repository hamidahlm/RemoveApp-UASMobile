import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFF292B37),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              //Navigate to Home Page
              Navigator.pushNamed(context, "homePage");
            },
            child: Icon(
              Icons.home,
              size: 35,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              //Navigate to CategoryPage
              Navigator.pushNamed(context, "categoryPage");
            },
            child: Icon(
              Icons.category,
              size: 35,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              //Navigate to FavoritePage
              Navigator.pushNamed(context, "favoritePage");
            },
            child: Icon(
              Icons.favorite_border,
              size: 35,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              //Navigate to ProfileView
              Navigator.pushNamed(context, "ProfileView");
            },
            child: Icon(
              Icons.person,
              size: 35,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
