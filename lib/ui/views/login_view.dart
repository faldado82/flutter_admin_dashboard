import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// las vistas no tienen scaffold
// los layouts si tienen scaffold

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'Login View',
          style: GoogleFonts.montserratAlternates(fontSize: 30),
        ),
      ),
    );
  }
}
