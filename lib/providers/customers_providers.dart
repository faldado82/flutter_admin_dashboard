import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/api/cafe_api.dart';
import 'package:flutter_admin_dashboard/models/http/users_response.dart';
import 'package:flutter_admin_dashboard/models/usuario.dart';

class CustomersProvider extends ChangeNotifier {
  List<Usuario> customers = [];
  bool isLoading = true;

  CustomersProvider() {
    getPaginatedCustomers();
  }

  getPaginatedCustomers() async {
    final response = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final customersResponse = UsersResponse.fromMap(response);
    customers = [... customersResponse.usuarios ];
    isLoading = false;
    notifyListeners();
  }
}
