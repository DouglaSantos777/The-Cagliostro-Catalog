import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/data/models/films.dart';
import 'package:o_catalogo_de_cagliostro/presentation/providers/films_provider.dart';
import 'package:o_catalogo_de_cagliostro/presentation/screens/film_screen.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/featured_film.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/film_list.dart';
import 'package:provider/provider.dart';

class ContentHome extends StatefulWidget {
  final List<Films> films;

  const ContentHome({super.key, required this.films});

  @override
  _ContentHomeState createState() => _ContentHomeState();
}

class _ContentHomeState extends State<ContentHome> {
  late Films featuredFilm;

  @override
  void initState() {
    super.initState();
    featuredFilm = widget.films[0];
  }

    void changeFeaturedFilm(Films film) async {
    final provider = Provider.of<FilmsProvider>(context, listen: false);
    final updatedFilm = await provider.fetchFilmById(film.id); 
    setState(() {
      featuredFilm = updatedFilm;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        children: [
          FeaturedFilm(
            title: featuredFilm.title,
            imageUrl: featuredFilm.image,
            director: featuredFilm.director,
            releaseDate: featuredFilm.releaseDate,
            rtScore: featuredFilm.rtScore,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilmScreen(film: featuredFilm),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          FilmList(
            films: widget.films,
            onFilmTap: changeFeaturedFilm,
          ),
        ],
      ),
    );
  }
}
