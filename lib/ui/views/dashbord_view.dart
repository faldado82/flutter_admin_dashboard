import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/ui/cards/white_card.dart';
import 'package:flutter_admin_dashboard/ui/labels/custom_labels.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Dashboard View', style: CustomLabels.h1),
          const SizedBox(height: 30),
          const WhiteCard(title: 'Sales Stadistic', child: Text('Hola Mundo'))
        ],
      ),
    );
  }
}
