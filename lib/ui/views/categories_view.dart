import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/datatables/categories_datasource.dart';
import 'package:flutter_admin_dashboard/ui/labels/custom_labels.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            source: CategoriesDataTableSource(),
            header: const Text('Available categories', maxLines: 2),
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text("I'm TextButton"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
