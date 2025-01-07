import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/content_home.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/error_message.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/header_home.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/loading_icon.dart';
import 'package:provider/provider.dart';
import 'package:o_catalogo_de_cagliostro/presentation/providers/film_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final provider = Provider.of<FilmProvider>(context, listen: false);
    provider.getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('build called');
    final provider = Provider.of<FilmProvider>(context);
    return Scaffold(
      appBar: const HeaderHome(title: "The Cagliostro Catalog"),
      body: provider.isLoading
          ? const LoadingIcon()
          : provider.error.isNotEmpty
              ? ErrorMessage(error: provider.error)
              : ContentHome(films: provider.films),
    );
  }
}
