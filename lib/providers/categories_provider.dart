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

  // Create New Category
  Future newCategory(String name) async {
    final data = {'nombre': name};
    try {
      final json = await CafeApi.httpPost('/categorias', data);
      final newCategory = Categoria.fromMap(json);
      categorias.add(newCategory);
      notifyListeners();
    } catch (e) {
      print(e);
      print('Error al crear nueva categoria');
    }
  }

  // UPDATE - PUT
  Future updateCategory(String id, String name) async {
    final data = {'nombre': name};
    try {
      await CafeApi.httpPut('/categorias/$id', data);

      // actualizo el nombre de la categoria
      categorias = categorias.map((category) {
        if (category.id != id) return category;
        category.nombre = name;
        return category;
      }).toList();

      notifyListeners();
    } catch (e) {
      print('$e, Error el actualizar la categoria');
    }
  }

  // delete igual al update
  Future deleteCategory(String id) async {
    // delete no lleva payload
    try {
      // mando un mapa vacio, porque espera un payload {}
      await CafeApi.httpDelete('/categorias/$id', {});

      // SI ESTOY ELIMINANDO Y LA ACCION SALE BIEN
      // LO UNICO QUE DEBE HACERSE ES REMOVER EL ELEMENTO DEL ARREGLO
      // PODRIA RECORRER LAS CATEGORIAS PERO SI EXISTEN MUCHAS NO ES MUY PERFORMANTE
      // PARA MEJORAR ESTO PODRIAMOS USAR UN FILTRO "REMOVE WHERE"

      categorias.removeWhere((categoria) => categoria.id == id);

      notifyListeners();
    } catch (e) {
      throw ('$e, Error el eliminar la categoria');
    }
  }
}
