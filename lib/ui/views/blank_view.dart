import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/ui/cards/white_card.dart';
import 'package:flutter_admin_dashboard/ui/labels/custom_labels.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Blank View', style: CustomLabels.h1),
          const SizedBox(height: 30),
          const WhiteCard(title: 'This is a Blank View', child: Text('Hello World'))
        ],
      ),
    );
  }
}
