import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/providers/auth_provider.dart';
import 'package:flutter_admin_dashboard/providers/login_form_provider.dart';
import 'package:flutter_admin_dashboard/router/router.dart';
import 'package:flutter_admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:flutter_admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter_admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:provider/provider.dart';

// las vistas no tienen scaffold
// los layouts si tienen scaffold

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);

        return Container(
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.symmetric(horizontal: 100),
          //color: Colors.red,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 450),
              child: Form(
                  // autovalidate mode chequea con cada tecla que sea valido
                  autovalidateMode: AutovalidateMode.always,
                  // key del formProvider traido desde login_form_provider.dart
                  key: loginFormProvider.formKey,
                  child: Column(
                    children: [
                      //Email
                      TextFormField(
                        onFieldSubmitted: (_) => onFormSubmit(loginFormProvider, authProvider),
                        // email_validator package
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) {
                            return 'Email not valid'; // si el mail no es valido se manda mensaje
                          }
                          return null;
                        },
                        onChanged: (value) => loginFormProvider.email = value,
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                        decoration: CustomInputs.loginInputDecoration(
                            hint: 'Enter your email', label: 'Email', icon: Icons.email_outlined),
                      ),
                      const SizedBox(height: 20),
                      //Password
                      TextFormField(
                        onFieldSubmitted: (_) => onFormSubmit(loginFormProvider, authProvider),
                        onChanged: (value) => loginFormProvider.password = value,
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
                      const SizedBox(height: 30),

                      CustomOutlinedButton(
                        // al apretar el boton se valida el form en login_form_provider.dart
                        onPressed: () => onFormSubmit(loginFormProvider, authProvider),
                        text: 'Enter',
                        // color: Colors.indigoAccent,
                        // isFilled: true,
                      ),

                      const SizedBox(height: 20),
                      LinkText(
                        text: 'Go to Register',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Flurorouter.registerRoute);
                        },
                      ),
                    ],
                  )),
            ),
          ),
        );
      }),
    );
  }

  void onFormSubmit(LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid) {
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
    }
  }
}
