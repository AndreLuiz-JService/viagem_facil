import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viagem_facil/shared/models/itens_model.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';

import 'malas_page_controller.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);
  final ItensModel item;
  final int index;
  @override
  Widget build(BuildContext context) {
    final malasController = Get.put(MalasPageController());
    malasController.userController.carregarUser();
    return Container(
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: item.select == true
                ? AppColors.vermelhoDesaturado
                : Colors.transparent,
          ),
          color: item.select == true
              ? AppColors.vermelhoDesaturado.withOpacity(0.1)
              : AppColors.greyMalas.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await malasController.selecionarItem(
                        index, item.select, item);
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    child: item.select == true
                        ? Icon(
                            Icons.check,
                            size: 20,
                            color: AppColors.vermelhoDesaturado,
                          )
                        : SizedBox(),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: item.select == true ? 2 : 1,
                          color: item.select == true
                              ? AppColors.vermelhoDesaturado
                              : AppColors.borderBlack.withOpacity(0.6),
                        ),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    item.nome!,
                    style: AppTextStyles.textBlack12px400w,
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () => malasController.addPublicacao(item, context),
              child: Container(
                width: 150,
                height: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  'Adicionar ao ranking',
                  style: AppTextStyles.textWhite12px,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
