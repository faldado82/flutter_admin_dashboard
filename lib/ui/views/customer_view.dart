// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/models/usuario.dart';
import 'package:flutter_admin_dashboard/providers/customers_providers.dart';
import 'package:flutter_admin_dashboard/providers/user_form_provider.dart';
import 'package:flutter_admin_dashboard/services/navigation_service.dart';
import 'package:flutter_admin_dashboard/services/notifications_service.dart';
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
    final userFormProvider = Provider.of<UserFormProvider>(context, listen: false);

    userProvider.getUserById(widget.uid).then((userDB) {
      if (userDB != null) {
        userFormProvider.user = userDB;
        userFormProvider.formKey = GlobalKey<FormState>();
        setState(() {
          user = userDB;
        });
      } else {
        NavigationService.replaceTo('/dashboard/customers');
      }
    });
  }

  @override
  void dispose() {
    user = null;
    Provider.of<UserFormProvider>(context, listen: false).user = null;
    super.dispose();
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
    return Table(
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
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm();

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final paginatedUsers = Provider.of<CustomersProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
      title: 'General Info',
      child: Form(
          key: userFormProvider.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              const SizedBox(height: 18),
              TextFormField(
                initialValue: user.nombre,
                decoration: CustomInputs.formInputDecoration(
                  hint: 'Write your user name',
                  label: 'Name',
                  icon: Icons.supervised_user_circle_outlined,
                ),
                onChanged: (value) => userFormProvider.userCopyWith(nombre: value),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter a name';
                  if (value.length < 3) return 'The name must be 3 or more characters';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: user.correo,
                decoration: CustomInputs.formInputDecoration(
                  hint: 'Write your emal',
                  label: 'Email',
                  icon: Icons.email_outlined,
                ),
                onChanged: (value) => userFormProvider.userCopyWith(correo: value),
                // email_validator package
                validator: (value) {
                  if (!EmailValidator.validate(value ?? '')) {
                    return 'Email not valid'; // si el mail no es valido se manda mensaje
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 100),
                child: ElevatedButton(
                  onPressed: () async {
                    // PUT actualizar usuario
                    final saved = await userFormProvider.updateUser();
                    if (saved) {
                      NotificationsService.showSnackBarSuccess('User Updated');
                      paginatedUsers.refreshUsers(user);
                    } else {
                      NotificationsService.showSnackBarError('User can not be saved');
                    }
                  },
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
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;
    final image = (user.img == null)
        ? const Image(image: AssetImage('no-image.jpg'))
        : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!);

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
                      ClipOval(child: image),

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
                            onPressed: () async {
                              // editar imagen de perfil
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['jpg', 'webp', 'png', 'jpeg'],
                                allowMultiple: false,
                              );

                              if (result != null) {
                                NotificationsService.showBusyIndicator(context);
                                final newUser = await userFormProvider.uploadImage(
                                    '/uploads/usuarios/${user.uid}', result.files.first.bytes!);
                                Provider.of<CustomersProvider>(context, listen: false)
                                    .refreshUsers(newUser);
                                Navigator.of(context).pop();
                              } else {
                                // User canceled the picker
                              }
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
              Text(
                user.nombre,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
