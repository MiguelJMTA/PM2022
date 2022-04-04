import 'dart:convert';

import 'package:flutter_interfaz/models/cast_model.dart';
import 'package:flutter_interfaz/models/popular_model.dart';
import 'package:http/http.dart' as http;

class ApiPopular {
  var URL = Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=5019e68de7bc112f4e4337a500b96c56&language=es-MX&page=1');

  Future<List<PopularModel>?> getAllPopular() async {
    var response = await http.get(URL);
    if (response.statusCode == 200) {
      var popular = jsonDecode(response.body)['results'] as List;
      return popular.map((movie) => PopularModel.fromMap(movie)).toList();
    } else {
      return null;
    }
  }

  Future<List<CastModel>?> getCast(int movie_id) async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$movie_id/credits?api_key=5019e68de7bc112f4e4337a500b96c56&language=en-US'));
    if (response.statusCode == 200) {
      var cast = jsonDecode(response.body)['cast'] as List;
      return cast.map((character) => CastModel.fromMap(character)).toList();
    } else {
      return null;
    }
  }

  Future<String?> getTrailer(int movie_id) async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$movie_id/videos?api_key=5019e68de7bc112f4e4337a500b96c56&language=en-US'));
    if (response.statusCode == 200) {
      var popular = jsonDecode(response.body)['results'] as List;
      String trailer = "";
      popular.forEach((element) {
        if (element['official'] && element['type'] == "Trailer") {
          trailer = element['key'];
        }
      });
      return trailer;
    } else {
      return "";
    }
  }
}
