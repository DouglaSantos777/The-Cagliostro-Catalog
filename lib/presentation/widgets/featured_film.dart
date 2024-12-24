import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/core/constants.dart';

class FeaturedFilm extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String releaseDate;
  final String rtScore;
  final String director;
  final Function onTap;

  const FeaturedFilm({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.releaseDate,
    required this.rtScore,
    required this.director,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox()),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: kTitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Director: $director',
                      style: kBodyTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Year: $releaseDate',
                          style: kBodyTextStyle,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          'Score: $rtScore',
                          style: kBodyTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
