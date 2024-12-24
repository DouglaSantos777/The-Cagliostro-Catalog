import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/core/constants.dart';

class HeaderHome extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HeaderHome({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center( 
        child: Text(
          "The Cagliostro Catalog",
          style: kAppBarTextStyle,
        ),
      ),
      backgroundColor: kAppBarColor,
      centerTitle: true,
    );
  }
}
