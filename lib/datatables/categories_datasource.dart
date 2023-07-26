import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/models/category.dart';
import 'package:flutter_admin_dashboard/providers/categories_provider.dart';
import 'package:flutter_admin_dashboard/services/notifications_service.dart';
import 'package:flutter_admin_dashboard/ui/modals/category_modal.dart';
import 'package:provider/provider.dart';

class CategoriesDataTableSource extends DataTableSource {
  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDataTableSource(this.categorias, this.context);
  /*
  A tener en cuenta, si yo tengo 4 DataCollumn, no puedo agregar mas cantidad de DataCell o habra un error
  */

  @override
  DataRow getRow(int index) {
    final categoria = categorias[index];

    return DataRow.byIndex(
        index: index, // necesario para no tener error de keys
        cells: [
          DataCell(Text(categoria.id)),
          DataCell(Text(categoria.nombre)),
          DataCell(Text(categoria.usuario.nombre)),
          DataCell(Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit_outlined, color: Colors.indigo.withOpacity(0.5)),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CategoryModal(
                      categoria: categoria,
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.red.withOpacity(0.8)),
                onPressed: () {
                  final dialog = AlertDialog(
                    title: const Text('Are you sure to delete ?'),
                    content: Text('Delete definitly ${categoria.nombre} ?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Cancelar Eliminacion
                          Navigator.of(context).pop();
                        },
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () async {
                          // Confirmar Eliminacion
                          final provider =  Provider.of<CategoriesProvider>(context, listen: false);
                          await provider.deleteCategory(categoria.id);
                          NotificationsService.showSnackBarSuccess('Category Deleted');
                          Navigator.of(context).pop(); // volvemos a la pantalla anterior
                        },
                        child: const Text('Yes, delete'),
                      ),
                    ],
                  );

                  // el dialog es todo el AlertDialog que esta escrito previamente
                  showDialog(context: context, builder: (_) => dialog);
                },
              )
            ],
          )),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;
}
