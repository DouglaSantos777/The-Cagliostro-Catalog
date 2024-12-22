import 'package:flutter/material.dart';
import 'package:o_catalogo_de_cagliostro/data/repositories/films_repository.dart';
import 'package:o_catalogo_de_cagliostro/presentation/providers/films_provider.dart';
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
        Provider<FilmsRepository>(create: (_) => FilmsRepository()),
        ChangeNotifierProvider<FilmsProvider>(
          create: (context) => FilmsProvider(Provider.of<FilmsRepository>(context, listen: false)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Cagliostro Catalog',
        theme: ThemeData(
          // Define o tema da aplicação, incluindo o background transparente
          scaffoldBackgroundColor: Colors.transparent,
          fontFamily: "Poppins",
        ),
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1E1E1E), Color(0xFF2A2A2A)], // Gradiente de Cinza Escuro
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
