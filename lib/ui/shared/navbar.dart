import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/ui/shared/widgets/search_text.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 80,
        decoration: buildBoxDecoration(),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Todo Icono Hamburguesa condicional
            IconButton(icon: const Icon(Icons.menu_outlined), onPressed: () {}),
            const SizedBox(width: 5),

            // Search box
            ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 250),
                child: const SearchText())
          ],
        ));
  }

  BoxDecoration buildBoxDecoration() =>
      const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 15,
        )
      ]);
}
