import 'package:projectmobile/model/data_cast.dart';

class Movie {
  final String id;
  final String judul;
  final String deskripsi;
  final String gambar;
  final String genre;
  final String rating;
  final String status;
  final List<Casts> casts;

  Movie(
      {required this.id,
      required this.judul,
      required this.deskripsi,
      required this.gambar,
      required this.genre,
      required this.rating,
      required this.status,
      required this.casts});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        gambar: json["gambar"],
        genre: json["genre"],
        rating: json["rating"],
        status: json["status"],
        casts: List<Casts>.from(json["casts"].map((x) => Casts.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "deskripsi": deskripsi,
        "gambar": gambar,
        "genre": genre,
        "rating": rating,
        "status": status,
        "casts": List<dynamic>.from(casts.map((x) => x.toJson())),
      };
}
