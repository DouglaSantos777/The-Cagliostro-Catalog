import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/core/constants.dart';
import 'package:o_catalogo_de_cagliostro/data/models/films.dart';

class FilmScreen extends StatelessWidget {
  final Films film;

  const FilmScreen({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.title,
        style: kAppBarTextStyle 
        ),
        backgroundColor: kAppBarColor,
        centerTitle: true,
         iconTheme: const IconThemeData(
          color: Colors.white, 
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(film.movieBanner, width: double.infinity, height: 300, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              film.title,
              style: kTitleTextStyle,
            ),
            const SizedBox(height: 8),
            Text(
              film.description,
              style: kBodyTextStyle,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Text(
              'Year: ${film.releaseDate}', 
              style: kBodyTextStyle,
            ),
            Text(
              'Score: ${film.rtScore}', 
              style: kBodyTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
