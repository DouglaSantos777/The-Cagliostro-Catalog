import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/core/constants.dart';

class FilmRow extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function onTap;

  const FilmRow({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        height: 80, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: kBodyTextStyle,
                overflow: TextOverflow.ellipsis, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
