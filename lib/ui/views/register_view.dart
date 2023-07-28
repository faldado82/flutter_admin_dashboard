import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_admin_dashboard/providers/auth_provider.dart';
import 'package:flutter_admin_dashboard/providers/register_form_provider.dart';
import 'package:flutter_admin_dashboard/router/router.dart';
import 'package:flutter_admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:flutter_admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter_admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:provider/provider.dart';

// las vistas no tienen scaffold
// los layouts si tienen scaffold

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RegisterFormProvider(),
        child: Builder(builder: (context) {
          final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

          return Container(
              //margin: const EdgeInsets.only(top: 100),
              padding: const EdgeInsets.symmetric(horizontal: 100),
              //color: Colors.red,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 520),
                  child: Form(
                      // autovalidate mode chequea con cada tecla que sea valido
                      autovalidateMode: AutovalidateMode.always,
                      key: registerFormProvider.formKey,
                      child: Column(
                        children: [
                          //Nombre y Apellido
                          TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-ZÀ-ÿ.\s]')),
                              // Permite solo letras y espacios
                              _CapitalizedWordsTextFormatter(),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Your Full Name';
                              }
                              if (value.length <= 6) {
                                return 'You First Name  and Last Name must have at least 6 characters'; // si el mail no es valido se manda mensaje
                              }
                              return null;
                            },
                            onChanged: (value) => registerFormProvider.fullName = value,
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                            decoration: CustomInputs.loginInputDecoration(
                                hint: 'Enter your Full Name',
                                label: 'First and Last Name',
                                icon: Icons.person_outlined),
                          ),
                          const SizedBox(height: 20),
                          //Email
                          TextFormField(
                            onChanged: (value) => registerFormProvider.email = value,
                            validator: (value) {
                              if (!EmailValidator.validate(value ?? '')) {
                                return 'Email not valid'; // si el mail no es valido se manda mensaje
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                            decoration: CustomInputs.loginInputDecoration(
                                hint: 'Enter your email',
                                label: 'Email',
                                icon: Icons.email_outlined),
                          ),
                          const SizedBox(height: 20),
                          //Password
                          TextFormField(
                            onChanged: (value) => registerFormProvider.password = value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Your Password';
                              }
                              if (value.length <= 6) {
                                return 'Password must contain 6 or more characters';
                              }
                              if (!value.contains(RegExp(r'[A-Z]'))) {
                                // no contiene Mayusculas
                                return 'Password must contain 1 Uppercase character';
                              }
                              if (!value.contains(RegExp(r'\d'))) {
                                // no contiene numeros
                                return 'Password must contain at least one number';
                              }
                              return null; // Password valido
                            },
                            obscureText: true,
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                            decoration: CustomInputs.loginInputDecoration(
                                hint: 'Enter your password',
                                label: 'Password',
                                icon: Icons.lock_outline),
                          ),
                          const SizedBox(height: 40),

                          CustomOutlinedButton(
                            onPressed: () {
                              final validForm = registerFormProvider.validateForm();
                              if (!validForm) return;

                              final authProvider =
                                  Provider.of<AuthProvider>(context, listen: false);
                              authProvider.register(
                                registerFormProvider.email,
                                registerFormProvider.password,
                                registerFormProvider.fullName,
                              );
                            },
                            text: 'Register',
                            // color: Colors.indigoAccent,
                            // isFilled: true,
                          ),

                          const SizedBox(height: 10),
                          LinkText(
                            text: 'Go to Login',
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, Flurorouter.loginRoute);
                            },
                          ),
                        ],
                      )),
                ),
              ));
        }));
  }
}

class _CapitalizedWordsTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String capitalizedText = newValue.text.toLowerCase();
    List<String> words = capitalizedText.split(' ');

    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      if (word.isNotEmpty) {
        words[i] = word[0].toUpperCase() + word.substring(1);
      }
    }

    capitalizedText = words.join(' ');

    return TextEditingValue(
      text: capitalizedText,
      selection: newValue.selection,
    );
  }
}
