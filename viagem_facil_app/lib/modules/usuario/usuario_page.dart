import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/shared/auth/auth_controller1.dart';
import 'package:viagem_facil/shared/routes/routes_principal.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';
import 'package:viagem_facil/shared/widget/bottomSheet/bottomsheet.dart';
import 'package:viagem_facil/shared/widget/confirmationButton/confirmation_button_transparent.dart';
import 'package:viagem_facil/shared/widget/confirmationPopup/confirmationPopup.dart';

class UsuarioPage extends StatelessWidget {
  const UsuarioPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ConfirmationPopup popup = ConfirmationPopup();
    final AuhtController userController = AuhtController();
    final size = MediaQuery.of(context).size;
    final user = Get.put(AuhtController());
    user.carregarUser();
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
                          RotasApp.Home, (Route<dynamic> route) => false,
                          arguments: user),
                  icon: Icon(CupertinoIcons.back),
                ),
                Text(
                  'Sua Conta',
                  style: AppTextStyles.titleBlack,
                )
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(71),
      ),
      body: GetBuilder<AuhtController>(
        builder: (_) => Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 79),
            height: size.height * 0.7,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.textForm, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Hero(
                      tag: 'foto perfil',
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 26),
                        width: 130.0,
                        height: 130.0,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.bottomSheet,
                            width: 1,
                          ),
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(user.user.value.photoURL!),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      user.user.value.name!,
                      style: AppTextStyles.textgrey16px,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: ConfirmationButtonTransparent(
                    onTap: () => Get.toNamed(RotasApp.EDITUSER),
                    text: 'Editar',
                    width: 106,
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.textForm,
                  endIndent: 15,
                  indent: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 26),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Meus dados',
                          style: AppTextStyles.titleBlack,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 26),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Nome completo',
                                style: AppTextStyles.textgrey14px,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                user.user.value.nameComplete == null
                                    ? 'Não informado'
                                    : user.user.value.nameComplete!,
                                style: AppTextStyles.textlightblack14px,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 26),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'E-mail',
                                style: AppTextStyles.textgrey14px,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                user.user.value.email!,
                                style: user.user.value.email!.length > 28
                                    ? AppTextStyles.textlightblack12px
                                    : AppTextStyles.textlightblack14px,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 26),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Nome de usuário',
                                style: AppTextStyles.textgrey14px,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                user.user.value.userName == null
                                    ? 'Não informado'
                                    : user.user.value.userName!,
                                style: AppTextStyles.textlightblack14px,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.textForm,
                  endIndent: 15,
                  indent: 15,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () => popup.confirmationPopup(
                            context,
                            () => userController.logout(),
                            'Sair',
                            'Deseja Sair da conta? ${user.user.value.name}',
                            true,
                            'SAIR',
                          ),
                          child: Text(
                            'Sair da conta',
                            style: AppTextStyles.textlitghtblack16px,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => popup.confirmationPopup(
                            context,
                            () => userController.logout(),
                            'Sair',
                            'Deseja Sair da conta? ${user.user.value.name}',
                            true,
                            'SAIR',
                          ),
                          icon: Icon(
                            Icons.logout,
                            color: AppColors.primary,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: BarraInferior(5),
    );
  }
}
