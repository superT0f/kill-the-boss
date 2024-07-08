import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var theme = ThemeData(
  useMaterial3: true,
  primarySwatch: Colors.orange,
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepOrange, brightness: Brightness.dark),
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.normal,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 42,
      fontStyle: FontStyle.italic,
    ),
    bodyMedium: GoogleFonts.roboto(),
    displaySmall: GoogleFonts.poppins(),
  ),
);
