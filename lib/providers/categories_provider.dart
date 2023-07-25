import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/api/cafe_api.dart';
import 'package:flutter_admin_dashboard/models/category.dart';
import 'package:flutter_admin_dashboard/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categorias = [];
  Future getCategories() async {
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

  Future updateCategory(String id, String name) async {
    final data = {"id": id, "name": name};
    try {
      await CafeApi.httpPut('categorias/$id', data);

      // actualizo el nombre de la categoria
      categorias = categorias.map((category) {
        if (category.id != id) return category;
        category.nombre = name;
        return category;
      }).toList();

      notifyListeners();
    } catch (e) {
      print(e);
      print('Error el actualizar la categoria');
    }
  }
}
