import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:flutter_admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:flutter_admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';

// los layouts si tienen scaffold
// las vistas no tienen scaffold

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        // Desktop
        _DesktopBody(child: child),
        // Mobile

        // LinksBar
        const LinksBar(),
      ],
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.9,
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
            child: Column(
              children: [
                const CustomTitle(),
                const SizedBox(height: 30),
                Expanded(child: child)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
