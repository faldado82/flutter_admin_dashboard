import 'package:flutter/material.dart';
//import 'package:flutter_admin_dashboard/providers/auth_provider.dart';

class LoginFormProvider extends ChangeNotifier {
  //para manejar el key del form a traves de Provider
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  // Injeccion de dependencia no usada
  // en vez de eso usamos el booleano del validateForm
  // final AuthProvider authProvider;
  // LoginFormProvider(this.authProvider);

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      //print('Form is valid');
      //print('$email === $password');
      return true;

      // viene de la injeccion que no se usa
      // authProvider.login(email, password);
    } else {
      //print('Form not valid');
      return false;
    }
  }
}
