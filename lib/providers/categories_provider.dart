import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/api/cafe_api.dart';
import 'package:flutter_admin_dashboard/models/category.dart';
import 'package:flutter_admin_dashboard/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categorias = [];
  getCategories() async {
    final response = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(response);
    categorias = [...categoriesResponse.categorias];
    print(categorias);
    notifyListeners();
  }
}
