import 'package:fluro/fluro.dart';
import 'package:flutter_admin_dashboard/router/admin_handlers.dart';
import 'package:flutter_admin_dashboard/router/no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  // Root Route
  static String rootRoute = '/';

  // Auth Route
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  //Dashboard Route
  static String dashboardRoute = '/dashboard';

  // Configure Routes with Handlers
  static void configureRoutes() {
    // Auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    // 404 Error - Page not found
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
