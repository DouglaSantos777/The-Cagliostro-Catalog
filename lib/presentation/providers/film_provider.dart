import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/data/repositories/film_repository.dart';
import 'package:o_catalogo_de_cagliostro/data/models/film.dart';

class FilmProvider extends ChangeNotifier {
  final FilmRepository _filmRepository;

  FilmProvider(this._filmRepository);

  bool isLoading = true;
  String error = '';
  List<Film> films = [];

  Future<void> getDataFromAPI() async {
    try {
      isLoading = true;
      notifyListeners();
      films = await _filmRepository.fetchFilms();
    } catch (e) {
      error = 'Error in serching films: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<Film> fetchFilmById(String id) async {
    try {
      final film = await _filmRepository.fetchFilmById(id);
      return film;
    } catch (e) {
      throw Exception('Failed in serching film: $e');
    }
  }
}
