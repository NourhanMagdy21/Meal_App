import 'package:flutter/material.dart';
import 'package:food_app/screens/categories_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: Color.fromARGB(223, 190, 43, 32)),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: CategoriesScreen(),
    );
  }
}
