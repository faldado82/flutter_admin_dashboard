// esta clase tendra los manejadores (handlers) de manera abstracta
// no tendremos la necesidad de instanciarlos
// Para acceder a ellos pondremos "AdminHandlers.NombreDelHandler"

import 'package:fluro/fluro.dart';
import 'package:flutter_admin_dashboard/ui/views/login_view.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, parameters) => const LoginView());
}
