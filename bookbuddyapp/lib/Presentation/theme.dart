import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightmode = ThemeData(
   fontFamily: GoogleFonts.raleway().fontFamily,
  colorScheme: const ColorScheme.light(
    background: Colors.white,
     primary: Colors.black,
    secondary: Color.fromARGB(255, 144, 144, 144),
   
  )
);

final ThemeData darkmode = ThemeData(
   fontFamily: GoogleFonts.raleway().fontFamily,
  colorScheme: const ColorScheme.dark(
    background: Color.fromARGB(255, 0, 0, 0),
    secondary: Color.fromARGB(255, 141, 141, 141),
    primary: Color.fromARGB(255, 255, 255, 255),
  )
);