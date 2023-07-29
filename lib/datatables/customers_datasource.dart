import 'package:flutter/material.dart';

class CustomersDataTableSource extends DataTableSource {
  @override
  DataRow getRow(int index) {
    // final customers = customers[index];

    return DataRow.byIndex(
        index: index, // necesario para no tener error de keys
        cells: [
          const DataCell(Text('avatar')),
          const DataCell(Text('nombre')),
          const DataCell(Text('email')),
          const DataCell(Text('id')),
          DataCell(Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit_outlined, color: Colors.indigo.withOpacity(0.5)),
                onPressed: () {
                  // showModalBottomSheet(
                  //   backgroundColor: Colors.transparent,
                  //   context: context,
                  //   builder: (_) => CategoryModal(
                  //     categoria: categoria,
                  //   ),
                  // );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.red.withOpacity(0.8)),
                onPressed: () {
                  // final dialog = AlertDialog(
                  //   title: const Text('Are you sure to delete ?'),
                  //   content: const Text('Delete definitly customer ?'),
                  //   actions: [
                  //     TextButton(
                  //       onPressed: () {
                  //         // Cancelar Eliminacion
                  //         // Navigator.of(context).pop();
                  //       },
                  //       child: const Text('No'),
                  //     ),
                  //     TextButton(
                  //       onPressed: () async {
                  //         // Confirmar Eliminacion
                  //         // final provider =  Provider.of<CategoriesProvider>(context, listen: false);
                  //         // await provider.deleteCategory(categoria.id);
                  //         // NotificationsService.showSnackBarSuccess('Category Deleted');
                  //         // Navigator.of(context).pop(); // volvemos a la pantalla anterior
                  //       },
                  //       child: const Text('Yes, delete'),
                  //     ),
                  //   ],
                  // );

                  // el dialog es todo el AlertDialog que esta escrito previamente
                  //showDialog(context: context, builder: (_) => dialog);
                },
              )
            ],
          )),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 100;

  @override
  int get selectedRowCount => 0;
}
