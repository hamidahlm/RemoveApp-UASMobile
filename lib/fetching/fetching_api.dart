import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:projectmobile/model/data_cast.dart';
import 'package:projectmobile/model/data_favorite.dart';
import 'package:projectmobile/model/data_movie.dart';

class FetchingAPI {
  Future<List<Movie>> fetchDataMovies() async {
    final String apiUrl =
        "https://movieapp-8dbe0-default-rtdb.firebaseio.com/movies.json";
    Response response = await http.get(Uri.parse(apiUrl));
    List<Movie> dataMovies;
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      dataMovies = jsonData.entries.map((entry) {
        return Movie(
          id: entry.key,
          judul: entry.value["judul"],
          deskripsi: entry.value["deskripsi"],
          gambar: entry.value["gambar"],
          genre: entry.value["genre"],
          rating: entry.value["rating"],
          status: entry.value["status"],
          casts: List<Casts>.from(
              entry.value["casts"].map((x) => Casts.fromJson(x))),
        );
      }).toList();

      return dataMovies;
    } else {
      throw Exception('Failed to load data places');
    }
  }

  Future<List<Favorite>> fetchDataFavorite() async {
    List<Favorite> dataFavorite = [];
    String uuid = '';
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      uuid = user.uid;
    }

    try {
      final String apiUrl =
          "https://movieapp-8dbe0-default-rtdb.firebaseio.com/favorites.json";
      Response response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> favoriteData = json.decode(response.body);

        for (var entry in favoriteData.entries) {
          if (entry.value['uuid'] == uuid) {
            dataFavorite = favoriteData.values.map((value) {
              return Favorite.fromJson(value);
            }).toList();
          }
        }
      }
    } catch (e) {
      print('ERROR Endpoint favorite: $e');
    }

    print(dataFavorite);
    return dataFavorite;
  }

  Future<bool> checkFavorite(judulMovie) async {
    bool isFavorite = false;
    String uuid = '';
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      uuid = user.uid;
    }

    try {
      final String apiUrl =
          "https://movieapp-8dbe0-default-rtdb.firebaseio.com/favorites.json";
      Response response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        Map<String, dynamic> favoriteData = json.decode(response.body);

        for (var key in favoriteData.keys) {
          if (favoriteData[key]['uuid'] == uuid &&
              favoriteData[key]['judul'] == judulMovie) {
            isFavorite = true;
            break;
          }
        }
      }
    } catch (e) {
      print(e);
    }
    return isFavorite;
  }

  Future<bool> toggleFavorite(
      bool isFavorite, String judulMovie, Movie movie) async {
    String uuid = '';
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      uuid = user.uid;
    }

    if (isFavorite) {
      try {
        final String apiUrl =
            "https://movieapp-8dbe0-default-rtdb.firebaseio.com/favorites.json";
        Response response = await http.get(Uri.parse(apiUrl));
        if (response.statusCode == 200) {
          Map<String, dynamic> favoriteData = json.decode(response.body);

          for (var key in favoriteData.keys) {
            if (favoriteData[key]['uuid'] == uuid &&
                favoriteData[key]['judul'] == judulMovie) {
              try {
                final response = await http.delete(
                  Uri.parse(
                    'https://movieapp-8dbe0-default-rtdb.firebaseio.com/favorites/$key.json',
                  ),
                );

                if (response.statusCode == 200) {
                  isFavorite = false;
                  print('Data favorit berhasil dihapus');
                } else {
                  print('Gagal menghapus data favorit: ${response.statusCode}');
                }
              } catch (e) {
                print('Terjadi kesalahan saat mengirim permintaan: $e');
                return false;
              }
              break;
            }
          }
        }
      } catch (e) {
        print('Terjadi kesalahan saat mengirim permintaan: $e');
      }
    } else {
      try {
        final response = await http.post(
          Uri.parse(
            'https://movieapp-8dbe0-default-rtdb.firebaseio.com/favorites.json',
          ),
          body: json.encode({
            'uuid': uuid,
            "judul": movie.judul,
            "deskripsi": movie.deskripsi,
            "gambar": movie.gambar,
            "genre": movie.genre,
            "rating": movie.rating,
            "status": movie.status,
            "casts": List<dynamic>.from(movie.casts.map((x) => x.toJson())),
          }),
          headers: {
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          isFavorite = true;
          print('Data favorit berhasil ditambahkan');
        } else {
          print('Gagal menambahkan data favorit: ${response.statusCode}');
        }
      } catch (e) {
        print('Terjadi kesalahan saat mengirim permintaan: $e');
      }
    }
    return isFavorite;
  }
}
