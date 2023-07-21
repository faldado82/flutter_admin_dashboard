// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class Categoria {
    String id;
    String nombre;
    UserCategory usuario;

    Categoria({
        required this.id,
        required this.nombre,
        required this.usuario,
    });

    factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        id: json["_id"],
        nombre: json["nombre"],
        usuario: UserCategory.fromMap(json["usuario"]),
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
        "usuario": usuario.toMap(),
    };
    

  @override
  String toString() => 'Categoria(nombre: $nombre)';
}

class UserCategory {
    String id;
    String nombre;

    UserCategory({
        required this.id,
        required this.nombre,
    });

    factory UserCategory.fromJson(String str) => UserCategory.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserCategory.fromMap(Map<String, dynamic> json) => UserCategory(
        id: json["_id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
    };
}
