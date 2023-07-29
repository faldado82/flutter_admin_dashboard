import 'package:fluro/fluro.dart';
import 'package:flutter_admin_dashboard/providers/auth_provider.dart';
import 'package:flutter_admin_dashboard/providers/side_menu_provider.dart';
import 'package:flutter_admin_dashboard/router/router.dart';
import 'package:flutter_admin_dashboard/ui/views/blank_view.dart';
import 'package:flutter_admin_dashboard/ui/views/categories_view.dart';
import 'package:flutter_admin_dashboard/ui/views/customers_view.dart';
import 'package:flutter_admin_dashboard/ui/views/dashbord_view.dart';
import 'package:flutter_admin_dashboard/ui/views/icons_view.dart';
import 'package:flutter_admin_dashboard/ui/views/login_view.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  // Dashboard
  static Handler dashboard = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const DashboardView();
    } else {
      return const LoginView();
    }
  });

  // Icons Handler
  static Handler icons = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.iconsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const IconsView();
    } else {
      return const LoginView();
    }
  });

  // Categories Handler
  static Handler categories = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.categoriesRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const CategoriesView();
    } else {
      return const LoginView();
    }
  });

  // Blank Handler
  static Handler blank = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(Flurorouter.blankRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const BlankView();
    } else {
      return const LoginView();
    }
  });

  // Customers Handler
  static Handler customers = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.customersRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const CustomersView();
    } else {
      return const LoginView();
    }
  });
}
