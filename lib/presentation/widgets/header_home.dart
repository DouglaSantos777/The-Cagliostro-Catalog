import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/core/constants.dart';

class HeaderHome extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HeaderHome({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: Text(title, style: kAppBarTextStyle),
        backgroundColor: kGhibliColor,
        elevation: 2,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
    );
  }
}
