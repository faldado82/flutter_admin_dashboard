import 'package:flutter/material.dart';
import 'package:flutter_admin_dashboard/models/category.dart';
import 'package:flutter_admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:flutter_admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter_admin_dashboard/ui/labels/custom_labels.dart';

class CategoryModal extends StatefulWidget {
  final Categoria? categoria;
  const CategoryModal({super.key, this.categoria});

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();
    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 500,
      width: 300,
      decoration: _buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.categoria?.nombre ?? 'Nueva Categoria',
                style: CustomLabels.h1.copyWith(color: Colors.white),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop,
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              )
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: widget.categoria?.nombre ?? '',
            onChanged: (value) => nombre = value,
            decoration: CustomInputs.loginInputDecoration(
              hint: 'Nombre de la categoria',
              label: 'Categoria',
              icon: Icons.new_releases_outlined,
            ),
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {},
              text: 'Guardar',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Color(0xff0F2041),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
            )
          ]);
}
