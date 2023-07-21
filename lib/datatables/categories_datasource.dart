import 'package:flutter/material.dart';

class CategoriesDataTableSource extends DataTableSource {
  /*
  A tener en cuenta, si yo tengo 4 DataCollumn, no puedo agregar mas cantidad de DataCell o habra un error
  */

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(
        index: index, // necesario para no tener error de keys
        cells: [
          DataCell(Text('Cell 1 Fila: $index')),
          DataCell(Text('Cell 2 Fila: $index')),
          DataCell(Text('Cell 3 Fila: $index')),
          DataCell(Text('Cell 4 Fila: $index')),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 100;

  @override
  int get selectedRowCount => 0;
}
