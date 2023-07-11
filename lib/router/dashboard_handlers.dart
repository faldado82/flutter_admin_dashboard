import 'package:fluro/fluro.dart';
import 'package:flutter_admin_dashboard/providers/auth_provider.dart';
import 'package:flutter_admin_dashboard/ui/views/login_view.dart';
import 'package:flutter_admin_dashboard/ui/views/main_dashbord_view.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      const MainDashboardView();
    } else {
      return const LoginView();
    }
    return null;
  });
}
