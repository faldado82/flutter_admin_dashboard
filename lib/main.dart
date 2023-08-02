import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/api/cafe_api.dart';
import 'package:flutter_admin_dashboard/providers/auth_provider.dart';
import 'package:flutter_admin_dashboard/providers/categories_provider.dart';
import 'package:flutter_admin_dashboard/providers/customers_providers.dart';
import 'package:flutter_admin_dashboard/providers/side_menu_provider.dart';
import 'package:flutter_admin_dashboard/router/router.dart';
import 'package:flutter_admin_dashboard/services/local_storage.dart';
import 'package:flutter_admin_dashboard/services/navigation_service.dart';
import 'package:flutter_admin_dashboard/services/notifications_service.dart';
import 'package:flutter_admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:flutter_admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:flutter_admin_dashboard/ui/layouts/splash/splash_layout.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => CustomersProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Dashboard',
      initialRoute: '/', // Flurorouter.root o Flurorouter.login es lo mismo
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);
        if (authProvider.authStatus == AuthStatus.checking) {
          return const SplashLayout();
        }
        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      },
      // manipulo el estilo del scrollbar
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(Colors.grey[500])),
      ),
    );
  }
}
