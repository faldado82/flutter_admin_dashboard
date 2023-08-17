import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/models/usuario.dart';
import 'package:flutter_admin_dashboard/services/navigation_service.dart';

class CustomersDataTableSource extends DataTableSource {
  final List<Usuario> customers;

  CustomersDataTableSource(this.customers);

  @override
  DataRow getRow(int index) {
    final Usuario user = customers[index];

    final image = (user.img == null)
        ? const Image(image: AssetImage('no-image.jpg'), width: 35, height: 35)
        : FadeInImage.assetNetwork(
            placeholder: 'loader.gif', image: user.img!, width: 35, height: 35);

    return DataRow.byIndex(
        index: index, // necesario para no tener error de keys
        cells: [
          DataCell(ClipOval(child: image)),
          DataCell(Text(user.nombre)),
          DataCell(Text(user.correo)),
          DataCell(Text(user.uid)),
          DataCell(Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit_outlined, color: Colors.indigo.withOpacity(0.5)),
                onPressed: () {
                  // Todo navegar a una nueva pantalla con el /uid del user
                  NavigationService.replaceTo('/dashboard/user/${user.uid}');
                },
              ),
            ],
          )),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => customers.length;

  @override
  int get selectedRowCount => 0;
}
