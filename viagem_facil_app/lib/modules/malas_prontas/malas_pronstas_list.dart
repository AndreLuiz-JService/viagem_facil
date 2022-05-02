import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/modules/malas_prontas/mala_selecionada_controller.dart';
import 'package:viagem_facil/modules/malas_prontas/mala_selecionada_page.dart';
import 'package:viagem_facil/shared/models/malas_model.dart';
import 'package:viagem_facil/shared/routes/routes_principal.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';
import 'package:viagem_facil/shared/widget/confirmationPopup/confirmationPopup.dart';

import 'malas_prontas_controller.dart';

class MalasProntasList extends StatelessWidget {
  const MalasProntasList({
    Key? key,
    required this.index,
    required this.mala,
    required this.malasController,
  }) : super(key: key);
  final int index;
  final MalasModel mala;
  final MalasProntasController malasController;

  @override
  Widget build(BuildContext context) {
    final malasSelecionadasController = Get.put(MalaSelecionadaController());
    final ConfirmationPopup popup = ConfirmationPopup();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onLongPress: () {
          popup.confirmationPopup(
            context,
            () => malasController.excluirMala(mala.id),
            'Tem certeza de que deseja excluir a mala ${mala.nome}?',
            'A mala sera excluída permanentemente e esse processo não poderá ser desfeito',
            true,
            'EXCLUIR ITEM',
          );
        },
        onTap: () {
          malasSelecionadasController.selecionarMala(mala);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MalasSelecionadaPage(
                  index: index,
                ),
              ));
        },
        child: Container(
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.greyMalas.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      mala.nome,
                      style: AppTextStyles.textBlack13px500w,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.chevron_right,
                    color: AppColors.primary,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
