import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

theme(context) {
  return ThemeData(
    textTheme: GoogleFonts.comicNeueTextTheme(
      Theme.of(context)
          .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.white,
      elevation: 20,
      titleTextStyle:
          TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
//    primaryColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber)
        .copyWith(secondary: Colors.amber),
  );
}
