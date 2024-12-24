import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/data/models/film.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/film_row.dart';

class FilmList extends StatelessWidget {
  final List<Film> films;
  final Function(Film) onFilmTap;

  const FilmList({super.key, required this.films, required this.onFilmTap});

  @override
  Widget build(BuildContext context) {
    return 
       ListView.builder(
        scrollDirection: Axis.horizontal, 
        itemCount: films.length,
        itemBuilder: (context, index) {
          final film = films[index];
          return FilmRow(
            imageUrl: film.image,
            title: film.title,
            onTap: () => onFilmTap(film),
          );
        },
      );
  }
}
