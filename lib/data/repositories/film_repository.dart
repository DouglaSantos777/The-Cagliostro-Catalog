import 'dart:convert';
import 'package:o_catalogo_de_cagliostro/data/models/film.dart';
import 'package:http/http.dart' as http;

class FilmRepository {
  static const String _url = 'https://ghibliapi.vercel.app/films';

  Future<List<Film>> fetchFilms() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        return data.map((e) => Film.fromJson(e)).toList();
      } else {
        throw Exception('Error on load films');
      }
    } catch (e) {
      throw Exception('Error on load films: $e');
    }
  }

  Future<Film> fetchFilmById(String id) async {
    try {
      final response = await http.get(Uri.parse('$_url/$id'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return Film.fromJson(data);
      } else {
        throw Exception('Error on load film with id $id');
      }
    } catch (e) {
      throw Exception('Error on load film by ID: $e');
    }
  }
}
