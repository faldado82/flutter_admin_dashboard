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

  Future newCategory(String name) async {
    final data = {'nombre': name};
    try {
      final json = await CafeApi.httpPost('categorias', data);
      final newCategory = Categoria.fromMap(json);
      categorias.add(newCategory);
      notifyListeners();
    } catch (e) {
      print(e);
      print('Error al crear categoria');
    }
  }
}
