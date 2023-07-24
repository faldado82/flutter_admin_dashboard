import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/providers/auth_provider.dart';
import 'package:flutter_admin_dashboard/ui/cards/white_card.dart';
import 'package:flutter_admin_dashboard/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Dashboard View', style: CustomLabels.h1),
          const SizedBox(height: 30),
          WhiteCard(
              title: 'Bienvenido/a ${authProvider.user!.nombre}.',
              child: Text('Tu usuario de login es: ${authProvider.user!.correo}')),
        ],
      ),
    );
  }
}
