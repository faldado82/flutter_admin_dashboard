import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/api/cafe_api.dart';
import 'package:flutter_admin_dashboard/models/http/auth_response.dart';
import 'package:flutter_admin_dashboard/models/usuario.dart';
import 'package:flutter_admin_dashboard/router/router.dart';
import 'package:flutter_admin_dashboard/services/local_storage.dart';
import 'package:flutter_admin_dashboard/services/navigation_service.dart';
import 'package:flutter_admin_dashboard/services/notifications_service.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }

  // LOGIN
  login(String email, String password) {
    final data = {'correo': email, 'password': password};

    // Peticion http POST LOGIN
    CafeApi.httpPost('/auth/login', data).then((json) {
      print(json);
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;
      // navegar al dashboard
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      //LocalStorage.prefs.getString('token');
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      print('Error en: $e');
      NotificationsService.showSnackBarError('User or Password not valid');
    });

    //_token = 'asasasasasaasdwwesdsdasdfgasg';
    LocalStorage.prefs.setString('token', _token!);
    LocalStorage.prefs.getString('token');

    // navegar al dashboard
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  // REGISTER
  register(String email, String password, String fullName) {
    final data = {'nombre': fullName, 'correo': email, 'password': password};
    // Peticion http POST REGISTER
    CafeApi.httpPost('/usuarios', data).then((json) {
      print(json);
      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;
      // navegar al dashboard
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      //LocalStorage.prefs.getString('token');
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      print('Error en: $e');
      NotificationsService.showSnackBarError('User or Password not valid');
    });
  }

  // Funcion para para validar autenticacion
  Future<bool> isAuthenticated() async {
    // NO esta autenticado
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // SI esta autenticado
    try {
      // hacemos el get de la respuesta
      final response = await CafeApi.httpGet('/auth');
      final authRespponse = AuthResponse.fromMap(response);
      LocalStorage.prefs.setString('token', authRespponse.token);
      user = authRespponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    // Se usaba antes para simular autenticacion
    /*
    await Future.delayed(const Duration(seconds: 1));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
    */
  }

  // LOGOUT
  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
