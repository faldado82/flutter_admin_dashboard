import 'package:flutter/widgets.dart';
import 'package:flutter_admin_dashboard/api/cafe_api.dart';
import 'package:flutter_admin_dashboard/models/usuario.dart';

class UserFormProvider extends ChangeNotifier {
  //para manejar el key del form a traves de Provider
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Usuario? user;

  userCopyWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = Usuario(
      rol: rol ?? user!.rol,
      estado: estado ?? user!.estado,
      google: google ?? user!.google,
      nombre: nombre ?? user!.nombre,
      correo: correo ?? user!.correo,
      uid: uid ?? user!.uid,
      img: img ?? user!.img,
    );
    notifyListeners();
  }

  bool _isValidForm() {
    return formKey.currentState!.validate();
  }

  Future updateUser() async {
    if (!_isValidForm()) return false;

    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo,
    };

    try {
      final response = await CafeApi.httpPut('/usuarios/${user!.uid}', data);
      print(response);
      return true;
    } catch (e) {
      print('Error al actualizar usuario $e');
      return false;
    }
  }
}
