// esta clase tendra los manejadores (handlers) de manera abstracta
// no tendremos la necesidad de instanciarlos
// Para acceder a ellos pondremos "AdminHandlers.NombreDelHandler"

import 'package:fluro/fluro.dart';
import 'package:flutter_admin_dashboard/providers/auth_provider.dart';
import 'package:flutter_admin_dashboard/ui/views/dashbord_view.dart';
import 'package:flutter_admin_dashboard/ui/views/login_view.dart';
import 'package:flutter_admin_dashboard/ui/views/register_view.dart';
import 'package:provider/provider.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      return const LoginView();
    } else {
      return const DashboardView();
    }
  });

  static Handler register = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      return const RegisterView();
    } else {
      return const DashboardView();
    }
  });
}
