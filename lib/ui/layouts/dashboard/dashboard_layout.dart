import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/ui/shared/navbar.dart';
import 'package:flutter_admin_dashboard/ui/shared/sidebar.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffedf1f2),
        body: Row(
          children: [
            // TODO hacer mas de 700px y menos de 700px
            // Admin Panel (Logo) y MenuItems (ListView de Iconos)
            const Sidebar(),

            Expanded(
              child: Column(
                children: [
                  // Navbar
                  const Navbar(),

                  // View (Vista de la pagina)
                  Expanded(child: child),
                ],
              ),
            )
          ],
        ));
  }
}
