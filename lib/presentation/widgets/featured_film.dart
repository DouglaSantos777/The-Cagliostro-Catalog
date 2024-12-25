import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/core/constants.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/film_image.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 8,
                  child: FilmImage(imageUrl: imageUrl, width: double.infinity)),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: kTitleTextStyle,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Director: ',
                            style: kHeaderTextStyle,
                          ),
                          TextSpan(
                            text: director,
                            style: kBodyTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Year: ',
                                style: kHeaderTextStyle,
                              ),
                              TextSpan(
                                text: releaseDate,
                                style: kBodyTextStyle,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Score: ',
                                style: kHeaderTextStyle,
                              ),
                              TextSpan(
                                text: rtScore,
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
            ],
          ),
        ),
      ),
    );
  }
}
