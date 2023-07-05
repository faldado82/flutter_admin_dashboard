import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';

// los layouts si tienen scaffold
// las vistas no tienen scaffold

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        // Desktop
        _DesktopBody()
        // Mobile

        // LinksBar
      ],
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      color: Colors.amber,
      child: Row(
        children: [
          // Flex - Twitter Background
          const BackgroundTwitter(),

          // Static - Login Form View
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            // child: // TODO: View LoginForm
          ),
        ],
      ),
    );
  }
}
