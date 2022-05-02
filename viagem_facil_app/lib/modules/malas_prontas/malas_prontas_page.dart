import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/modules/malas_prontas/malas_prontas_controller.dart';
import 'package:viagem_facil/shared/auth/auth_controller1.dart';
import 'package:viagem_facil/shared/routes/routes_principal.dart';
import 'package:viagem_facil/shared/themes/app_images.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';
import 'package:viagem_facil/shared/widget/bottomSheet/bottomsheet.dart';
import 'package:viagem_facil/shared/widget/confirmationPopup/confirmationPopup.dart';

import 'malas_pronstas_list.dart';

class MalasProntasPage extends StatelessWidget {
  const MalasProntasPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final malasController = Get.put(MalasProntasController());
    final size = MediaQuery.of(context).size;
    final ConfirmationPopup popup = ConfirmationPopup();
    final user = Get.put(AuhtController());
    malasController.carregarMala();
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
                  'Malas prontas',
                  style: AppTextStyles.titleBlack,
                )
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(71),
      ),
      body: GetBuilder<MalasProntasController>(
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
                        'Veja e edite as malas que você já fez para outras viagens',
                        style: AppTextStyles.textBlack16px,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: size.width,
                  child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        return MalasProntasList(
                          malasController: malasController,
                          mala: malasController.malasList.value[index],
                          index: index,
                        );
                      },
                      itemCount: malasController.malasList.value.length),
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


