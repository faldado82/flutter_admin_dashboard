import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/providers/auth_provider.dart';
import 'package:flutter_admin_dashboard/providers/side_menu_provider.dart';
import 'package:flutter_admin_dashboard/router/router.dart';
import 'package:flutter_admin_dashboard/services/navigation_service.dart';
import 'package:flutter_admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:flutter_admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:flutter_admin_dashboard/ui/shared/widgets/text_separator.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  void navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50),
          const TextSeparator(text: 'Main'),
          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            isActive: sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
            onPressed: () => navigateTo(Flurorouter.dashboardRoute),
          ),
          MenuItem(text: 'Orders', icon: Icons.shopping_cart_checkout_outlined, onPressed: () {}),
          MenuItem(text: 'Analytics', icon: Icons.show_chart_outlined, onPressed: () {}),
          MenuItem(text: 'Categories', icon: Icons.layers_outlined, onPressed: () {}),
          MenuItem(text: 'Products', icon: Icons.dashboard_outlined, onPressed: () {}),
          MenuItem(text: 'Discounts', icon: Icons.attach_money_outlined, onPressed: () {}),
          MenuItem(text: 'Customers', icon: Icons.people_alt_outlined, onPressed: () {}),
          const SizedBox(height: 30),
          const TextSeparator(text: 'UI Elements'),
          MenuItem(
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            onPressed: () => navigateTo(Flurorouter.iconsRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
          ),
          MenuItem(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Campaign',
            icon: Icons.note_add_outlined,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Blank',
            icon: Icons.post_add_outlined,
            onPressed: () => navigateTo(Flurorouter.blankRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
          ),
          const SizedBox(height: 50),
          const TextSeparator(text: 'Exit Panel'),
          MenuItem(
              text: 'LogOut',
              icon: Icons.exit_to_app_outlined,
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              }),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0xff092044),
        Color(0xff092040),
      ]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
