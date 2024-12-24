import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/core/constants.dart';
import 'package:o_catalogo_de_cagliostro/data/models/film.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Importando o widget de loading

class FilmScreen extends StatelessWidget {
  final Film film;

  const FilmScreen({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.title, style: kAppBarTextStyle),
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
            Flexible(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  film.movieBanner,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const Center(
                        child: SpinKitSpinningLines(
                          color: Colors.white,
                          size: 100.0,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            )
          ],
        ),
      ),
    );
  }
}
