// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/models/usuario.dart';
import 'package:flutter_admin_dashboard/providers/customers_providers.dart';
import 'package:flutter_admin_dashboard/ui/cards/white_card.dart';
import 'package:flutter_admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter_admin_dashboard/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

class CustomerView extends StatefulWidget {
  final String uid;

  const CustomerView({Key? key, required this.uid}) : super(key: key);

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<CustomersProvider>(context, listen: false);
    userProvider.getUserById(widget.uid).then((userDB) => setState(() {
          user = userDB;
        }));
    print(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Customer View', style: CustomLabels.h1),
          const SizedBox(height: 30),
          if (user == null)
            WhiteCard(
              child: Container(
                alignment: Alignment.center,
                height: 400,
                child: const CircularProgressIndicator(),
              ),
            ),
          if (user != null) _UserViewBody()
        ],
      ),
    );
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        // ancho de columna
        columnWidths: const {0: FixedColumnWidth(250)},
        children: [
          TableRow(children: [
            // avatar
            _AvatarContainer(),

            // formulario de actualizacion
            const _UserViewForm(),
          ])
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: 'General Info',
      child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              const SizedBox(height: 18),
              TextFormField(
                decoration: CustomInputs.formInputDecoration(
                  hint: 'Write your user name',
                  label: 'Name',
                  icon: Icons.supervised_user_circle_outlined,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: CustomInputs.formInputDecoration(
                  hint: 'Write your emal',
                  label: 'Email',
                  icon: Icons.email_outlined,
                ),
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 100),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.save_as_outlined),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 8,
                        ),
                        child: Text('Save'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          )),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WhiteCard(
        width: 250,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Profile', style: CustomLabels.h2),
              const SizedBox(height: 20),
              SizedBox(
                  width: 150,
                  height: 160,
                  child: Stack(
                    children: [
                      // avatar image
                      const ClipOval(child: Image(image: AssetImage('no-image.jpg'))),

                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white, width: 5),
                          ),
                          child: FloatingActionButton(
                            onPressed: () {
                              //todo seleccionar imagen
                            },
                            elevation: 0,
                            backgroundColor: Colors.indigo,
                            child: const Icon(
                              Icons.camera_alt_outlined,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              const Text(
                'User Name',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
