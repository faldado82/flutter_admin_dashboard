import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/router/router.dart';
import 'package:flutter_admin_dashboard/ui/layouts/auth/auth_layout.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(const MyApp());
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
      builder: (_, child) {
        return const AuthLayout();
      },
    );
  }
}
