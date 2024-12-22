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
      child: Container(
        height: 300,
        width: 300,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover, 
              ),
              Text(
                title,
                style: kTitleTextStyle,
                textAlign: TextAlign.center, 
              ),
              Text(
                'Director: ${director}',
                style: kBodyTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Year: ${releaseDate}',
                    style: kBodyTextStyle,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Score: ${rtScore}',
                    style: kBodyTextStyle,
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
