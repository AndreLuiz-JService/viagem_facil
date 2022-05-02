import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/database/db.dart';
import 'package:viagem_facil/shared/auth/auth_controller1.dart';
import 'package:viagem_facil/shared/models/itens_model.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';
import 'package:viagem_facil/shared/widget/confirmationButton/confirmation_button.dart';
import 'package:viagem_facil/shared/widget/confirmationButton/confirmation_button_transparent.dart';
import 'package:viagem_facil/shared/widget/confirmationPopup/confirmationPopup.dart';
import 'package:viagem_facil/shared/widget/dropdownwidgt/drop_down_widget.dart';
import 'package:viagem_facil/shared/widget/textFormWidget/text_form_widget.dart';

class MalasPageController extends GetxController {
  var itemSelecionado = ItemMenu(nome: 'Geral', value: 0).obs;
  List<DropdownMenuItem<ItemMenu>>? listaItensMenu;

  bool _excluirIsSelect = false;
  get excluirIsSelect => _excluirIsSelect.obs;

  final ConfirmationPopup popup = ConfirmationPopup();
  final formKey = GlobalKey<FormState>();
  AuhtController userController = AuhtController();
  ItensModel _itens = ItensModel();
  var _itensList = [];
  get itensList => _itensList.obs;

  String? validateNomedoItem(String? value) =>
      value?.isEmpty ?? true ? "O nome do item não pode ser vazio" : null;

  String? validateNomedaMala(String? value) =>
      value?.isEmpty ?? true ? "O nome da mala não pode ser vazio" : null;

  String nameMala = '';

  void onChange({
    String? nome,
    int? categoria,
  }) {
    _itens = _itens.copyWith(
      nome: nome,
      categoria: categoria,
    );
  }

  Future<void> selecionarItem(int index, bool isSelect, ItensModel item) async {
    if (_excluirIsSelect) {
      item.select = !item.select;
      _itensList[index] = item;
      update();
    }
  }

  int itensSelectAmount() {
    int contador = 0;
    for (int i = 0; i < _itensList.length; i++) {
      if (_itensList[i].select) {
        contador++;
      }
    }
    return contador;
  }

  void excluirItens() {
    for (int i = 0; i < _itensList.length; i++) {
      if (_itensList[i].select) {
        _itensList.removeAt(i);
        i--;
      }
    }
    update();
    Get.back();
  }

  void changeExcluirIsSelect() {
    _excluirIsSelect = !_excluirIsSelect;
    if (!_excluirIsSelect) {
      for (int i = 0; i < _itensList.length; i++) {
        _itensList[i].select = false;
        update();
      }
    }
    update();
  }

  void callShowDialog(BuildContext context, bool isAddItem) async {
    if (isAddItem) {
      listaItensMenu = Menu.getListaItens();
      itemSelecionado = listaItensMenu![0].value!.obs;
      onChange(categoria: itemSelecionado.value.value);
    }
    ShowDialogAddItem(context);
  }

  void SalvarItem(
    BuildContext context,
  ) async {
    final form = formKey.currentState;
    if (form!.validate()) {
      _itensList.insert(0, _itens);
      update();
      Get.back();
    }
  }

  void addItemRanking(String nome, int categoria) {
    _itensList.insert(0, ItensModel(categoria: categoria,nome: nome));
  }

  void SalvarMala(
    BuildContext context,
  ) async {
    final form = formKey.currentState;
    if (form!.validate()) {
      addMala();
    }
  }

  addMala() async {
    var db = await DB.get();
    db.insert('Mala', {
      'nome': nameMala,
    });
    List<Map> id =
        await db.rawQuery("SELECT ID FROM Mala ORDER BY ID DESC LIMIT 1");

    for (int i = 0; i < _itensList.length; i++) {
      db.insert('Item', {
        'Nome': _itensList[i].nome,
        'Categoria': _itensList[i].categoria,
        'Mala_ID': id[0]['ID'],
      });
    }

    _itensList.clear();
    Get.back();
    update();
  }

  addPublicacao(ItensModel item, BuildContext context) async {
    print(userController.user.value.id);
    userController.carregarUser();
    var db = await DB.get();
    db.insert('Publicacao', {
      'Usuario_ID': userController.user.value.id,
      'Nome': item.nome,
      'Categoria': item.categoria,
      'Nome_user': userController.user.value.name,
      'photo_URL': userController.user.value.photoURL
    });
    popup.confirmationPopup(
        context,
        () => Get.back(),
        'Sucesso',
        'sua publicação foi adicionada ao feeding com sucesso',
        false,
        'Voltar');
    update();
  }

  void ShowDialogAddItem(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 600),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            height: 350,
            child: Material(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox.expand(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Icon(
                          Icons.close,
                          color: AppColors.grey.withOpacity(0.8),
                        ),
                        onPressed: () => Get.back(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10),
                      child: Text(
                          'Digite um nome e escolha a categoria do item',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.textRoxo18px),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Form(
                        key: formKey,
                        child: TextFormWidget(
                            label: 'Nome do item',
                            initialValue: '',
                            validator: validateNomedoItem,
                            onChanged: (value) {
                              onChange(nome: value);
                            }),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, bottom: 5),
                          child: Text('Categoria do item'),
                        ),
                        Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(4),
                            border:
                                Border.all(color: AppColors.textForm, width: 1),
                          ),
                          child: Obx(
                            () => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: GestureDetector(
                                child: DropdownButton(
                                  value: itemSelecionado.value,
                                  items: listaItensMenu,
                                  dropdownColor: AppColors.primary,
                                  onChanged: (value) async {
                                    itemSelecionado.value = value as ItemMenu;
                                    onChange(categoria: value.value);
                                    update();
                                  },
                                  icon: Icon(
                                    CupertinoIcons.chevron_down,
                                    color: AppColors.bottomSheet,
                                  ),
                                  focusColor: Colors.white,
                                  isExpanded: true,
                                  iconSize: 24,
                                  elevation: 16,
                                  underline: Container(),
                                  style: AppTextStyles.textWhite14px,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ConfirmationButtonTransparent(
                        onTap: () {
                          SalvarItem(context);
                        },
                        text: 'ADICIONAR ITEM',
                        width: 300,
                      ),
                    )
                  ],
                ),
              ),
            ),
            margin: EdgeInsets.only(left: 12, right: 12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  void ShowDialogSalvarMala(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 600),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            height: 220,
            child: Material(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('Digite um nome para a sua mala',
                          style: AppTextStyles.textRoxo18px),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Form(
                        key: formKey,
                        child: TextFormWidget(
                            label: 'Nome da mala',
                            initialValue: '',
                            validator: validateNomedaMala,
                            onChanged: (value) {
                              nameMala = value;
                            }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: ConfirmationButton(
                            onTap: () {
                              Get.back();
                            },
                            text: 'CANCELAR',
                            cor: AppColors.vermelhoDesaturado,
                            width: 147,
                          ),
                        ),
                        ConfirmationButton(
                          onTap: () {
                            SalvarMala(context);
                          },
                          text: 'SALVAR MALA',
                          width: 147,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            margin: EdgeInsets.only(left: 12, right: 12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}
