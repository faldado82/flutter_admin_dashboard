import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/router/router.dart';
import 'package:flutter_admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:flutter_admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter_admin_dashboard/ui/inputs/custom_inputs.dart';

// las vistas no tienen scaffold
// los layouts si tienen scaffold

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 100),
      //color: Colors.red,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 370),
          child: Form(
              child: Column(
            children: [
              //Nombre y Apellido
              TextFormField(
                // validator:
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: CustomInputs.loginInputDecoration(
                    hint: 'Enter your Full Name',
                    label: 'First and Last Name',
                    icon: Icons.person_outlined),
              ),
              const SizedBox(height: 20),
              //Email
              TextFormField(
                // validator:
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: CustomInputs.loginInputDecoration(
                    hint: 'Enter your email',
                    label: 'Email',
                    icon: Icons.email_outlined),
              ),
              const SizedBox(height: 20),
              //Password
              TextFormField(
                // validator:
                obscureText: true,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: CustomInputs.loginInputDecoration(
                    hint: 'Enter your password',
                    label: 'Password',
                    icon: Icons.lock_outline),
              ),
              const SizedBox(height: 30),

              CustomOutlinedButton(
                onPressed: () {},
                text: 'Register',
                // color: Colors.indigoAccent,
                // isFilled: true,
              ),

              const SizedBox(height: 20),
              LinkText(
                text: 'Go to Login',
                onPressed: () {
                  Navigator.pushNamed(context, Flurorouter.loginRoute);
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}