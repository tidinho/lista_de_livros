import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/lista_livro_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.kalamTextTheme(Theme.of(context).textTheme),
      ),
      home: ListaLivrosPage(),
    );
  }
}
