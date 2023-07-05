import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          '404 - Error, No Page Found',
          style: GoogleFonts.montserratAlternates(fontSize: 50),
        ),
      ),
    );
  }
}
