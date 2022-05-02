import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/shared/models/itens_model.dart';

class MalasModel extends GetxController {
  final int id;
  final String nome;
  final List<ItensModel> itens;
  MalasModel({
    required this.id ,
    required this.nome,
    required this.itens,
  });


 

  
  

  MalasModel copyWith({
    int? id,
    String? nome,
    List<ItensModel>? itens,
  }) {
    return MalasModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      itens: itens ?? this.itens,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'itens': itens.map((x) => x.toMap()).toList(),
    };
  }

  factory MalasModel.fromMap(Map<String, dynamic> map) {
    return MalasModel(
      id: map['id'],
      nome: map['nome'],
      itens: List<ItensModel>.from(map['itens']?.map((x) => ItensModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MalasModel.fromJson(String source) => MalasModel.fromMap(json.decode(source));

  @override
  String toString() => 'MalasModel(id: $id, nome: $nome, itens: $itens)';

 

  
}
