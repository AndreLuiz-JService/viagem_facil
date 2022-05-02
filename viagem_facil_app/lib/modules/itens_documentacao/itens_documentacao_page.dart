import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/modules/itens_documentacao/itens_documentacao_controller.dart';
import 'package:viagem_facil/modules/itens_documentacao/itens_essencias_page.dart';
import 'package:viagem_facil/shared/routes/routes_principal.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';
import 'package:viagem_facil/shared/widget/bottomSheet/bottomsheet.dart';
import 'package:viagem_facil/shared/widget/toggleButton/toggleButton.dart';

import 'documentos_page.dart';

class ItensEDocumentacaoPage extends StatelessWidget {
  const ItensEDocumentacaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ItensEDocumentacaoController());
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Container(
            height: 71,
            alignment: Alignment.center,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamedAndRemoveUntil(
                          RotasApp.Home, (Route<dynamic> route) => false),
                  icon: Icon(CupertinoIcons.back),
                ),
                Text(
                  'Itens essenciais e documentação',
                  style: AppTextStyles.titleBlack,
                )
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(71),
      ),
      body: GetBuilder<ItensEDocumentacaoController>(
        builder: (_) => Center(
          child: Column(
            children: [
              ToggleButtonWidget(
                background: AppColors.toggleButton,
                ontap: controller.toggleButtons,
                primary: AppColors.primary,
                toggleValue: controller.varToggleButton.value,
              ),
              controller.varToggleButton.value ? ItensEssenciasPage(controller: controller,) : DocumentosPage(controller: controller,),
              
              BarraInferior(2)
            ],
          ),
        ),
      ),
    );
  }
}


