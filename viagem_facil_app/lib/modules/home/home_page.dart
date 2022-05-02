import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/modules/home/home_controller.dart';
import 'package:viagem_facil/modules/home/rankingCard.dart';
import 'package:viagem_facil/modules/home/topBar_home.dart';
import 'package:viagem_facil/shared/auth/auth_controller1.dart';
import 'package:viagem_facil/shared/models/user_model.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_images.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';
import 'package:viagem_facil/shared/widget/bottomSheet/bottomsheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Get.put(AuhtController());
    final controller = Get.put(HomeController());
    user.carregarUser();
    controller.carregarpublicacao();
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10))),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Mais populares',
                      style: AppTextStyles.titleHome,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width,
                    height: 83,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        TopBar_home(
                          imagen: AppImages.imagen_verao,
                          text: 'Verão',
                        ),
                        TopBar_home(
                          imagen: AppImages.imagen_acampamento,
                          text: 'Acampamento',
                        ),
                        TopBar_home(
                          imagen: AppImages.imagen_inverno,
                          text: 'Inverno',
                        ),
                        TopBar_home(
                          imagen: AppImages.imagen_parque,
                          text: 'Parque',
                        ),
                        TopBar_home(
                          imagen: AppImages.imagen_praia,
                          text: 'Praia',
                        ),
                        TopBar_home(
                          imagen: AppImages.imagen_cachoeira,
                          text: 'Cachoeira',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(152)),
        body: Container(
          height: size.height - 70,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Ranking',
                        style: AppTextStyles.titleBlack,
                      ),
                    ),
                  ),
                  GetBuilder<HomeController>(
                    builder: (_) => Expanded(
                      child: ListView.builder(
                        itemBuilder: (ctx, index) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: RankingCard(
                                index: index,
                                homeController: controller,
                                id_publicacao: controller
                                    .publicacaoList[index].idPublicacao,
                                tipo: controller.publicacaoList[index].tipo,
                                size: size,
                                deslikes: controller
                                    .publicacaoList[index].deslikes,
                                image: controller
                                    .publicacaoList[index].photoURL,
                                likes:
                                    controller.publicacaoList[index].likes,
                                posicao: index + 1,
                                title:
                                    controller.publicacaoList[index].title,
                                name: controller
                                    .publicacaoList[index].nameUser,
                                categoria: controller
                                    .publicacaoList[index].categoria,
                              ),
                            ),
                          );
                        },
                        itemCount: controller.publicacaoList.length,
                      ),
                    ),
                  ),
                  SizedBox(height: 55,)
                ],
              ),
              Positioned(
                bottom: 0,
                child: BarraInferior(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
