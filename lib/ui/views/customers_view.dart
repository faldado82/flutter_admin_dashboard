import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/datatables/customers_datasource.dart';
import 'package:flutter_admin_dashboard/providers/customers_providers.dart';
import 'package:flutter_admin_dashboard/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

class CustomersView extends StatefulWidget {
  const CustomersView({super.key});

  @override
  State<CustomersView> createState() => _CustomersViewState();
}

class _CustomersViewState extends State<CustomersView> {
  int _rowsPerPage = 10; //PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final customersProvider = Provider.of<CustomersProvider>(context);

    final customerDataSource = CustomersDataTableSource(customersProvider.customers);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Customers View', style: CustomLabels.h1),
          const SizedBox(height: 30),
          PaginatedDataTable(
            sortAscending: customersProvider.ascending,
            sortColumnIndex: customersProvider.sortColumnIndex,
            columns: [
              const DataColumn(label: Text('Avatar')),
              DataColumn(
                  label: const Text('Nombre'),
                  onSort: (colIndex, _) {
                    customersProvider.sortColumnIndex = colIndex;
                    customersProvider.sort<String>((user) => user.nombre);
                  }),
              DataColumn(
                  label: const Text('Email'),
                  onSort: (colIndex, _) {
                    customersProvider.sortColumnIndex = colIndex;
                    customersProvider.sort<String>((user) => user.correo);
                  }),
              const DataColumn(label: Text('Customer ID')),
              const DataColumn(label: Text('Actions')),
            ],
            source: customerDataSource,
            header: const Text('Available categories', maxLines: 2),
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            onPageChanged: (page) {
              //print(page);
            },
          )
        ],
      ),
    );
  }
}
