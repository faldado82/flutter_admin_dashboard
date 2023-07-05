import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkText extends StatelessWidget {
  final String text;
  const LinkText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
            fontSize: 20,
            color: Colors.grey[700],
            decoration: TextDecoration.underline),
      ),
    );
  }
}
