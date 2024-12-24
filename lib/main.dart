import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/data/repositories/film_repository.dart';
import 'package:o_catalogo_de_cagliostro/presentation/providers/film_provider.dart';
import 'package:o_catalogo_de_cagliostro/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          fontFamily: "Poppins",
        ),
        builder: (context, child) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1E1E1E), Color(0xFF2A2A2A)], 
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
