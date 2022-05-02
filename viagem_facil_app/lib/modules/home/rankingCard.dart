import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/modules/home/home_controller.dart';
import 'package:viagem_facil/modules/malas/malas_page_controller.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_images.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';

import 'clipHome.dart';

class RankingCard extends StatelessWidget {
  const RankingCard({
    Key? key,
    required this.index,
    required this.id_publicacao,
    required this.tipo,
    required this.homeController,
    required this.categoria,
    required this.size,
    required this.posicao,
    required this.deslikes,
    required this.likes,
    required this.title,
    required this.name,
    required this.image,
  }) : super(key: key);

  final int index;
  final int id_publicacao;
  final HomeController homeController;
  final int categoria;
  final int tipo;
  final Size size;
  final int posicao;
  final String title;
  final int likes;
  final int deslikes;
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    final malasController = Get.put(MalasPageController());
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            height: 100,
            width: size.width * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.CardRanking,
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    color: Colors.black26,
                    spreadRadius: 1,
                    offset: Offset(0, 4))
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 45, right: 12, top: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.titleBlack,
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(image),
                            backgroundColor: Colors.blue,
                            maxRadius: 18,
                            minRadius: 15,
                          ),
                          Text(
                            name,
                            style: AppTextStyles.textBlack12px,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 10, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 90,
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40,
                              child: GestureDetector(
                                onTap:()=> homeController.evaluatePost(1,tipo,id_publicacao,index),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      AppImages.iconeLike,
                                      width: 20,
                                      height: 20,
                                      color: tipo == 1 ? Colors.green: Colors.black,
                                    ),
                                    Text(
                                      likes.toString(),
                                      style: AppTextStyles.textBlack14px,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              child: GestureDetector(
                                onTap: () => homeController.evaluatePost(-1,tipo,id_publicacao, index),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top:2.0),
                                      child: Image.asset(
                                        AppImages.iconeDeslike,
                                        width: 20,
                                        height: 20,
                                        color: tipo == -1 ? AppColors.vermelhoDesaturado : Colors.black,
                                      ),
                                    ),
                                    GetBuilder<HomeController>(
                                      builder:(_) => Text(
                                        deslikes.toString(),
                                        style: AppTextStyles.textBlack14px,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            malasController.addItemRanking(title, categoria),
                        child: Container(
                          width: 155,
                          height: 28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            'Adicionar à sua mala',
                            style: AppTextStyles.textWhite14px,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: ClipPath(
            clipper: ClipHome(),
            child: Container(
              width: 43,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.primary,
              ),
              child: Container(
                padding: EdgeInsets.only(right: 8, bottom: 6),
                alignment: Alignment.center,
                child: Text(
                  '$posicaoº',
                  style: AppTextStyles.titleHome,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
