import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// los layouts si tienen scaffold
// las vistas no tienen scaffold

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            'Auth Layout',
            style: GoogleFonts.montserratAlternates(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
