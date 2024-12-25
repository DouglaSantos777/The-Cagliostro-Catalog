import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/core/constants.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/film_image.dart';

class FilmBlock extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function onTap;

  const FilmBlock({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width * 1 / 2.6;

    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilmImage(
              imageUrl: imageUrl,
              width: size,
              height: size,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                title,
                style: kHeaderTextStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
