import 'package:dio/dio.dart';
import 'package:flutter_admin_dashboard/services/local_storage.dart';

class CafeApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    //Base Url
    _dio.options.baseUrl = "http://localhost:8080/api";

    // Configure Headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };
  }

  // Peticiones Http
  // GET
  static Future httpGet(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } catch (e) {
      print(e);
      throw ('Error en GET del HTTP');
    }
  }

  // POST
  static Future httpPost(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final response = await _dio.post(path, data: formData);
      return response.data;
    } catch (e) {
      print(e);
      throw ('Error en POST del HTTP');
    }
  }
}