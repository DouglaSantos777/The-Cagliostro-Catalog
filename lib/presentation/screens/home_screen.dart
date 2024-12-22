import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/core/constants.dart';
import 'package:o_catalogo_de_cagliostro/presentation/providers/films_provider.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/content_home.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/error_message.dart';
import 'package:o_catalogo_de_cagliostro/presentation/widgets/loadingIcon.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final provider = Provider.of<FilmsProvider>(context, listen: false);
    provider.getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('build called');
    final provider = Provider.of<FilmsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "The Cagliostre Catalog",
          style: kAppBarTextStyle
          ),
        backgroundColor: kAppBarColor,
        centerTitle: true
      ),
      body: provider.isLoading
          ? const LoadingIcon()
          : provider.error.isNotEmpty
              ? ErrorMessage(error: provider.error)
              : ContentHome(films: provider.films),
    );
  }
}
