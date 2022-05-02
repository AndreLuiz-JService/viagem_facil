import 'package:flutter/material.dart';

class ItemMenu {
  String nome;
  int value;
  ItemMenu({
    required this.nome,
    required this.value,
  });
}
class Menu {
  static List<ItemMenu> getItens() {
    return [
      ItemMenu(nome: 'Geral', value: 0),
      ItemMenu(nome: 'Verão', value: 1),
      ItemMenu(nome: 'Inverno', value: 2),
      ItemMenu(nome: 'Praia', value: 3),
      ItemMenu(nome: 'Acampamento', value: 4),
      ItemMenu(nome: 'Cachoeiras', value: 5),
      ItemMenu(nome: 'Parques', value: 6),
    ];
  }

  static List<DropdownMenuItem<ItemMenu>> getDropdownMenuItens(List itens) {
    List<DropdownMenuItem<ItemMenu>> listaItensMenu = [];
    for (ItemMenu variedade in itens) {
      listaItensMenu.add(
        DropdownMenuItem(
          value: variedade,
          child: Text(variedade.nome),
        ),
      );
    }
    return listaItensMenu;
  }

  static List<DropdownMenuItem<ItemMenu>> getListaItens() {
    return getDropdownMenuItens(getItens());
  }
}