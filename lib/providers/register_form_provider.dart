import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  //para manejar el key del form a traves de Provider
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String fullName = '';
  String email = '';
  String password = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form is valid');
      print('$fullName - $email - $password');
      return true;
    } else {
      print('Form not valid');
      return false;
    }
  }
}
