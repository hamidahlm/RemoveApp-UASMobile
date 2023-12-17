import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectmobile/Login.dart';
import 'package:projectmobile/widgets/CustomNavBar.dart';

class ProfileView extends StatefulWidget {
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String username = '', email = '';

  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        email = user.email ?? '';
        username = user.displayName ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green.withOpacity(0.8),
                  Colors.green.withOpacity(0.3),
                  Colors.green.withOpacity(0),
                ],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(11.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16),
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage("images/profile.jpg"),
                    ),
                    SizedBox(height: 16),
                    Text(
                      username,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        _auth.signOut();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFF292B37),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
