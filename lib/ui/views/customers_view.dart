import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/datatables/customers_datasource.dart';
import 'package:flutter_admin_dashboard/ui/labels/custom_labels.dart';

class CustomersView extends StatefulWidget {
  const CustomersView({super.key});

  @override
  State<CustomersView> createState() => _CustomersViewState();
}

class _CustomersViewState extends State<CustomersView> {
  int _rowsPerPage = 100; //PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final customerDataSource = CustomersDataTableSource();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Customers View', style: CustomLabels.h1),
          const SizedBox(height: 30),
          PaginatedDataTable(
            columns: const [
              DataColumn(label: Text('Avatar')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Email')),
              DataColumn(label: Text('Customer ID')),
              DataColumn(label: Text('Actions')),
            ],
            source: customerDataSource,
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
                  // showModalBottomSheet(
                  //   backgroundColor: Colors.transparent,
                  //   context: context,
                  //   builder: (_) => const CategoryModal(
                  //     categoria: null,
                  //   ),
                  // );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
