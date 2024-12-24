import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/data/repositories/films_repository.dart';
import 'package:o_catalogo_de_cagliostro/data/models/films.dart';

class FilmsProvider extends ChangeNotifier {
  final FilmsRepository _filmsRepository;

  FilmsProvider(this._filmsRepository);

  bool isLoading = true;
  String error = '';
  List<Films> films = [];

  Future<void> getDataFromAPI() async {
    try {
      isLoading = true;
      notifyListeners();
      films = await _filmsRepository.fetchFilms();
    } catch (e) {
      error = 'Error in serching films: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<Films> fetchFilmById(String id) async {
    try {
      final film = await _filmsRepository.fetchFilmById(id);
      return film;
    } catch (e) {
      throw Exception('Failed in serching film: $e');
    }
  }
}
