import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/data/models/films.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/film_row.dart';

class FilmList extends StatelessWidget {
  final List<Films> films;
  final Function(Films) onFilmTap;

  const FilmList({super.key, required this.films, required this.onFilmTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: films.length, // Corrigindo para films.length, já que você quer todos os filmes
        itemBuilder: (context, index) {
          final film = films[index];
          return FilmRow(
            imageUrl: film.image,
            title: film.title,
            onTap: () => onFilmTap(film), // Passando a função para o onTap
          );
        },
      ),
    );
  }
}
