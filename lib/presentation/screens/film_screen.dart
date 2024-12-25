import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/core/constants.dart';
import 'package:o_catalogo_de_cagliostro/data/models/film.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/film_image.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/header_home.dart';

class FilmScreen extends StatelessWidget {
  final Film film;

  const FilmScreen({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderHome(title: film.title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilmImage(
                imageUrl: film.movieBanner,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .4,
              ),
              Column(
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
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Director: ',
                          style: kHeaderTextStyle,
                        ),
                        TextSpan(
                          text: film.director,
                          style: kBodyTextStyle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Producer: ',
                          style: kHeaderTextStyle,
                        ),
                        TextSpan(
                          text: film.producer,
                          style: kBodyTextStyle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Year: ',
                          style: kHeaderTextStyle,
                        ),
                        TextSpan(
                          text: film.releaseDate,
                          style: kBodyTextStyle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Score: ',
                          style: kHeaderTextStyle,
                        ),
                        TextSpan(
                          text: film.rtScore,
                          style: kBodyTextStyle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Running Time: ',
                          style: kHeaderTextStyle,
                        ),
                        TextSpan(
                          text: film.runningTime,
                          style: kBodyTextStyle,
                        ),
                      ],
                    ),
                  ),                
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
