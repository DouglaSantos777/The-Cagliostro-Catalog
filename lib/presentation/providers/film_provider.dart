import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/data/repositories/film_repository.dart';
import 'package:o_catalogo_de_cagliostro/data/models/film.dart';

class FilmProvider extends ChangeNotifier {
  final FilmRepository _filmRepository;

  FilmProvider(this._filmRepository);

  bool isLoading = false;
  String error = '';
  List<Film> films = [];

  Future<void> getDataFromAPI() async {
    isLoading = true;
    error = '';
    notifyListeners();

    try {
      films = await _filmRepository.fetchFilms();
    } catch (e) {
      error = 'Failed to load films. Please try again later.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<Film?> fetchFilmById(String id) async {
    try {
      return await _filmRepository.fetchFilmById(id);
    } catch (e) {
      error = 'Failed to load film with ID $id. Please try again later.';
      notifyListeners();
      return null;
    }
  }
}
