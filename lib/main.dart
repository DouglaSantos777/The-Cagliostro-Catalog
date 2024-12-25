import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/data/repositories/film_repository.dart';
import 'package:o_catalogo_de_cagliostro/presentation/providers/film_provider.dart';
import 'package:o_catalogo_de_cagliostro/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FilmRepository>(create: (_) => FilmRepository()),
        ChangeNotifierProvider<FilmProvider>(
          create: (context) => FilmProvider(Provider.of<FilmRepository>(context, listen: false)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Cagliostro Catalog',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          fontFamily: "Ghibli",
        ),
        builder: (context, child) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [ Color.fromARGB(255, 8, 68, 105), Color(0xFF1E1E1E)], 
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: child,
          );
        },
        home: const HomeScreen(),
      ),
    );
  }
}
