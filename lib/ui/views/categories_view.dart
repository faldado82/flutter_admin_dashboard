import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/datatables/categories_datasource.dart';
import 'package:flutter_admin_dashboard/providers/categories_provider.dart';
import 'package:flutter_admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter_admin_dashboard/ui/modals/category_modal.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriesProvider>(context).categorias;

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Categories View', style: CustomLabels.h1),
          const SizedBox(height: 30),
          PaginatedDataTable(
            //arrowHeadColor: Colors.indigo,

            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Category')),
              DataColumn(label: Text('Created by')),
              DataColumn(label: Text('Actions')),
            ],
            source: CategoriesDataTableSource(categorias, context),
            header: const Text('Available categories', maxLines: 2),
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              IconButton(
                icon: Icon(Icons.add, color: Colors.indigo.withOpacity(0.8)),
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => const CategoryModal(
                      categoria: null,
                    ),
                  );
                },
              ),
              // CustomIconButton(
              //   onPress: () {
              //     showModalBottomSheet(
              //       backgroundColor: Colors.transparent,
              //       context: context,
              //       builder: (_) => const CategoryModal(
              //         categoria: null,
              //       ),
              //     );
              //   },
              //   text: 'Crear',
              //   icon: Icons.add,
              // ),
            ],
          )
        ],
      ),
    );
  }
}
