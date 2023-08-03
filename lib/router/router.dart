import 'package:fluro/fluro.dart';
import 'package:flutter_admin_dashboard/router/admin_handlers.dart';
import 'package:flutter_admin_dashboard/router/dashboard_handlers.dart';
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
  static String iconsRoute = '/dashboard/icons';
  static String categoriesRoute = '/dashboard/categories';
  static String blankRoute = '/dashboard/blank';
  static String customersRoute = '/dashboard/customers';
  static String userRoute = '/dashboard/user/:uid';

  // Configure Routes with Handlers
  static void configureRoutes() {
    // Auth Routes
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    // Dashboard Routes
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard, transitionType: TransitionType.fadeIn);

    router.define(iconsRoute,
        handler: DashboardHandlers.icons, transitionType: TransitionType.fadeIn);

    router.define(categoriesRoute,
        handler: DashboardHandlers.categories, transitionType: TransitionType.fadeIn);

    router.define(blankRoute,
        handler: DashboardHandlers.blank, transitionType: TransitionType.fadeIn);

    router.define(customersRoute,
        handler: DashboardHandlers.customers, transitionType: TransitionType.fadeIn);

    router.define(userRoute,
        handler: DashboardHandlers.user, transitionType: TransitionType.fadeIn);

    // 404 Error - Page not found
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
