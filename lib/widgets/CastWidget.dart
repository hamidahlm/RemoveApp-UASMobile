import 'package:flutter/material.dart';
import 'package:projectmobile/model/data_cast.dart';

class CastWidget extends StatelessWidget {
  final List<Casts> cast;
  CastWidget({required this.cast});

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
                "Casts",
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
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < cast.length; i++)
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: ClipOval(
                    child: Image.network(
                      cast[i].foto,
                      height: 100,
                      width: 100, // Set sesuai dengan kebutuhan Anda
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
