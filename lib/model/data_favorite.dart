import 'package:projectmobile/model/data_cast.dart';

class Favorite {
  final String uuid;
  final String judul;
  final String deskripsi;
  final String gambar;
  final String genre;
  final String rating;
  final String status;
  final List<Casts> casts;

  Favorite(
      {required this.uuid,
      required this.judul,
      required this.deskripsi,
      required this.gambar,
      required this.genre,
      required this.rating,
      required this.status,
      required this.casts});

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        uuid: json["uuid"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        gambar: json["gambar"],
        genre: json["genre"],
        rating: json["rating"],
        status: json["status"],
        casts: List<Casts>.from(json["casts"].map((x) => Casts.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "judul": judul,
        "deskripsi": deskripsi,
        "gambar": gambar,
        "genre": genre,
        "rating": rating,
        "status": status,
        "casts": List<dynamic>.from(casts.map((x) => x.toJson())),
      };
}
