import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget implements PreferredSizeWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("The Cagliostre Catalog"),
      backgroundColor: Colors.deepPurple,
    );
  }
}
