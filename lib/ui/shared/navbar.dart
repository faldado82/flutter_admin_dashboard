import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/providers/side_menu_provider.dart';
import 'package:flutter_admin_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:flutter_admin_dashboard/ui/shared/widgets/notifications_indicator.dart';
import 'package:flutter_admin_dashboard/ui/shared/widgets/search_text.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: 80,
        decoration: buildBoxDecoration(),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (size.width <= 700)
              IconButton(
                icon: const Icon(Icons.menu_outlined),
                onPressed: () => SideMenuProvider.openMenu(),
              ),
            const SizedBox(width: 10),

            // Search box
            if (size.width > 410)
              ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: const SearchText()),

            const Spacer(),
            const NotificationsIndicator(),

            const SizedBox(width: 10),
            const NavbarAvatar(),
            const SizedBox(width: 20),
          ],
        ));
  }

  BoxDecoration buildBoxDecoration() =>
      const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 15,
        )
      ]);
}
