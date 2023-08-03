import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/api/cafe_api.dart';
import 'package:flutter_admin_dashboard/models/http/users_response.dart';
import 'package:flutter_admin_dashboard/models/usuario.dart';

class CustomersProvider extends ChangeNotifier {
  List<Usuario> customers = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;

  CustomersProvider() {
    getPaginatedCustomers();
  }

  getPaginatedCustomers() async {
    final response = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final customersResponse = UsersResponse.fromMap(response);
    customers = [...customersResponse.usuarios];
    isLoading = false;
    notifyListeners();
  }

  Future<Usuario?> getUserById(String uid) async {
    try {
      final response = await CafeApi.httpGet('/usuarios/$uid');
      final userResponse = Usuario.fromMap(response);
      return userResponse;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    customers.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
    });
    ascending = !ascending;
    notifyListeners();
  }

  void refreshUsers(Usuario newUser) {
    customers = customers.map((user) {
      if (user.uid == newUser.uid) {
        user = newUser;
      }
      return user;
    }).toList();

    notifyListeners();
  }
}
