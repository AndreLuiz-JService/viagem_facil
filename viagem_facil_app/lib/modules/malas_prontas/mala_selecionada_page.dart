import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/modules/malas/malas_item_list.dart';
import 'package:viagem_facil/modules/malas/malas_page_controller.dart';
import 'package:viagem_facil/modules/malas_prontas/mala_selecionada_item_list.dart';
import 'package:viagem_facil/shared/auth/auth_controller1.dart';
import 'package:viagem_facil/shared/models/malas_model.dart';
import 'package:viagem_facil/shared/models/user_model.dart';
import 'package:viagem_facil/shared/routes/routes_principal.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_images.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';
import 'package:viagem_facil/shared/widget/bottomSheet/bottomsheet.dart';
import 'package:viagem_facil/shared/widget/confirmationButton/confirmation_button.dart';
import 'package:viagem_facil/shared/widget/confirmationPopup/confirmationPopup.dart';

import 'mala_selecionada_controller.dart';
import 'malas_prontas_controller.dart';

class MalasSelecionadaPage extends StatelessWidget {
  final int index;
  const MalasSelecionadaPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final malaController = Get.put(MalasProntasController());
    final malaSelecionadaController = Get.put(MalaSelecionadaController());
    final ConfirmationPopup popup = ConfirmationPopup();
    malaSelecionadaController.userController.carregarUser();
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Container(
            height: 71,
            alignment: Alignment.center,
            child: Row(
              children: [
                IconButton(
                  onPressed: () async {
                    malaController.carregarMala();
                    Get.back();
                  },
                  icon: Icon(CupertinoIcons.back),
                ),
                Text(
                  malaSelecionadaController.mala.value.nome,
                  style: AppTextStyles.titleBlack,
                )
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(71),
      ),
      body: GetBuilder<MalaSelecionadaController>(
        builder: (_) => Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      child: Image.asset(AppImages.imagen_mala),
                    ),
                    Container(
                      height: 56,
                      width: size.width - 88,
                      margin: EdgeInsets.only(left: 8),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Personalize e organize os itens para a sua viagem',
                        style: AppTextStyles.textBlack16px,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 19, right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    malaSelecionadaController.excluirIsSelect.value
                        ? Text(
                            '${malaSelecionadaController.itensSelectAmount()}  itens selecionados',
                            style: AppTextStyles.textred13px,
                          )
                        : Container(),
                    TextButton(
                        onPressed: () {
                          malaSelecionadaController.changeExcluirIsSelect();
                        },
                        child: Text(
                          malaSelecionadaController.excluirIsSelect.value
                              ? 'Cancelar'
                              : 'Excluir itens',
                          style: AppTextStyles.textred13px,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return index !=
                              malaSelecionadaController.mala.value.itens.length
                          ? Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ItemListMalaSelecionada(
                                item: malaSelecionadaController
                                    .mala.value.itens[index],
                                index: index,
                              ),
                            )
                          : ButtonAdicionarItem(
                              malaController: malaSelecionadaController);
                    },
                    itemCount: malaSelecionadaController.excluirIsSelect.value
                        ? malaSelecionadaController.mala.value.itens.length
                        : malaSelecionadaController.mala.value.itens.length + 1,
                  ),
                ),
              ),
              malaSelecionadaController.excluirIsSelect.value
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ConfirmationButton(
                        cor: AppColors.vermelhoDesaturado,
                        size: size,
                        icon: malaSelecionadaController.excluirIsSelect.value
                            ? Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.delete_outline_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              )
                            : null,
                        porcentagem: 0.95,
                        text: 'EXCLUIR ITENS',
                        onTap: () {
                          popup.confirmationPopup(
                            context,
                            () => malaSelecionadaController.excluirItens(),
                            'Tem certeza de que deseja excluir esses itens?',
                            'Os itens serão excluídos permanentemente e esse processo não poderá ser desfeito',
                            true,
                            'EXCLUIR ITEM',
                          );
                        },
                      ),
                    )
                  : malaSelecionadaController.itensSelectAmount() == 0
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ConfirmationButton(
                            cor: null,
                            size: size,
                            icon: null,
                            porcentagem: 0.95,
                            text: 'Usar para nova viagem',
                            onTap: () async {
                              malaSelecionadaController.ShowDialogSalvarMala(
                                  context);
                            },
                          ),
                        ),
              BarraInferior(4),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonAdicionarItem extends StatelessWidget {
  const ButtonAdicionarItem({
    Key? key,
    required this.malaController,
  }) : super(key: key);

  final MalaSelecionadaController malaController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.greyMalas.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GestureDetector(
            onTap: () => malaController.callShowDialog(context, true),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  child: Container(
                    width: 25,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.borderBlack.withOpacity(0.6),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'adicionar item',
                    style: AppTextStyles.textBlack12px400w,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
