import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  //para manejar el key del form a traves de Provider
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  validateForm() {
    formKey.currentState!.validate();
  }
}
