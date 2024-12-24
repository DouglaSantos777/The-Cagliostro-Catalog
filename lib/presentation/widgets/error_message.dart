import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/core/constants.dart';

class ErrorMessage extends StatelessWidget {
  final String error;

  const ErrorMessage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: const TextStyle(
          color: kAppBarColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
