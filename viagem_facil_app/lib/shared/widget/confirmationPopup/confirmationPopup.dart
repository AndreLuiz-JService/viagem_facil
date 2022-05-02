import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:viagem_facil/shared/models/user_model.dart';
import 'package:viagem_facil/shared/routes/routes_principal.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';
import 'package:viagem_facil/shared/widget/confirmationButton/confirmation_button.dart';

class ConfirmationPopup {
  confirmationPopup(
    BuildContext context,
    VoidCallback funcao,
    String textprincipal,
    String textsecundari,
    bool dialogButtonSecundari,
    String textConfirmar,
  ) {
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
            height: 250,
            child: Material(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.close,
                            color: AppColors.grey.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                           horizontal: 12),
                      child: Text(
                        textprincipal,
                        style: AppTextStyles.textRoxo18px,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        textsecundari,
                        style: AppTextStyles.textgrey16px,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        dialogButtonSecundari?
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: ConfirmationButton(
                            onTap: () {
                              Get.back();
                            },
                            text: 'CANCELAR',
                            cor: AppColors.vermelhoDesaturado,
                            width: 150,
                          ),
                        ): SizedBox(),
                        ConfirmationButton(
                          onTap: funcao,
                          text: textConfirmar,
                          width: 150,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 12),
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
