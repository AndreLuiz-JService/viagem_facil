import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/modules/home/home_controller.dart';
import 'package:viagem_facil/shared/models/user_model.dart';
import 'package:viagem_facil/shared/routes/routes_principal.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_images.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';
import 'package:viagem_facil/shared/widget/bottomSheet/stack_bottom.dart';

class BarraInferior extends StatelessWidget {
  final int indice;

  BarraInferior(
    this.indice,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 78,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          indice == 1
              ? StackBottom(
                  size: size,
                  image: AppImages.icone_mala,
                  text: 'Sua mala',
                )
              : GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(RotasApp.MALAS),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 23),
                    child: Container(
                      width: size.width * 0.18,
                      height: 55,
                      color: AppColors.bottomSheet,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(AppImages.icone_mala, height: 25),
                          Text(
                            'Sua mala',
                            style: AppTextStyles.textBlack10px500w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          indice == 2
              ? StackBottom(
                  size: size,
                  image: AppImages.icone_itens,
                  text: 'Itens',
                )
              : GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed(RotasApp.ITENSDOCUMENTACAO),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 23),
                    child: Container(
                      width: size.width * 0.18,
                      height: 55,
                      color: AppColors.bottomSheet,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(AppImages.icone_itens, height: 25),
                          Text(
                            'Itens',
                            style: AppTextStyles.textBlack10px500w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          indice == 3
              ? StackBottom(
                  size: size,
                  image: AppImages.icone_home,
                  text: 'Home',
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RotasApp.Home,
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 23),
                    child: Container(
                      width: size.width * 0.18,
                      height: 55,
                      color: AppColors.bottomSheet,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(AppImages.icone_home, height: 25),
                          Text(
                            'Home',
                            style: AppTextStyles.textBlack10px500w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          indice == 4
              ? StackBottom(
                  size: size,
                  image: AppImages.icone_malas_prontas,
                  text: 'Malas Prontas',
                )
              : GestureDetector(
                  onTap: () => Get.toNamed(
                    RotasApp.MALASPRONTAS,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 23),
                    child: Container(
                      width: size.width * 0.18,
                      height: 55,
                      color: AppColors.bottomSheet,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(AppImages.icone_malas_prontas,
                              height: 25),
                          Text(
                            'Malas Prontas',
                            style: AppTextStyles.textBlack10px500w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          indice == 5
              ? StackBottom(
                  size: size,
                  image: AppImages.icone_conta,
                  text: 'Conta',
                )
              : GestureDetector(
                  onTap: () => Get.toNamed(
                    RotasApp.Conta,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 23),
                    child: Container(
                      width: size.width * 0.18,
                      height: 55,
                      color: AppColors.bottomSheet,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(AppImages.icone_conta, height: 25),
                          Text(
                            'Conta',
                            style: AppTextStyles.textBlack10px500w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
