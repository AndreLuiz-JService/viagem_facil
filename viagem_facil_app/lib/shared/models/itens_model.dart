import 'dart:convert';

import 'package:get/get.dart';

class ItensModel extends GetxController {
  final int? id;
  bool select;
  final String? nome;
  final int? idItemDaMala;
  final int? categoria;

  ItensModel({
    this.select = false,
    this.id,
    this.nome,
    this.idItemDaMala,
    this.categoria,
  });

  ItensModel copyWith({ 
    int? id,
    String? nome,
    int? idItemDaMala,
    int? categoria,
  }) {
    return ItensModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      idItemDaMala: idItemDaMala ?? this.idItemDaMala,
      categoria: categoria ?? this.categoria,
    );
  }

  factory ItensModel.fromJson(String source) => ItensModel.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idItemDaMala': idItemDaMala,
      'categoria': categoria,
    };
  }

  factory ItensModel.fromMap(Map<String, dynamic> map) {
    return ItensModel(
      id: map['id'],
      nome: map['nome'],
      idItemDaMala: map['idItemDaMala'],
      categoria: map['categoria'],
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ItensModel(id: $id, nome: $nome,  idItemDaMala: $idItemDaMala, categoria: $categoria)';
  }
  
}
