import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/data/models/film.dart';
import 'package:o_catalogo_de_cagliostro/presentation/providers/film_provider.dart';
import 'package:o_catalogo_de_cagliostro/presentation/screens/film_screen.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/featured_film.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/film_list.dart';
import 'package:provider/provider.dart';

class ContentHome extends StatefulWidget {
  final List<Film> films;

  const ContentHome({super.key, required this.films});

  @override
  _ContentHomeState createState() => _ContentHomeState();
}

class _ContentHomeState extends State<ContentHome> {
  late Film featuredFilm;

  @override
  void initState() {
    super.initState();
    featuredFilm = widget.films[0];
  }

  void changeFeaturedFilm(Film film) async {
    final provider = Provider.of<FilmProvider>(context, listen: false);
    final updatedFilm = await provider.fetchFilmById(film.id);
    setState(() {
      featuredFilm = updatedFilm ?? film;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 3,
            child: FeaturedFilm(
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
          ),
          const Flexible(
            flex: 1,
            child: SizedBox()),
          Flexible(
            flex: 2,
             child: FilmList(
                films: widget.films,
                onFilmTap: changeFeaturedFilm,
              ),
            ),
        ],
      ),
    );
  }
}
