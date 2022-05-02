import 'package:flutter/material.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';

class ToggleButtonWidget extends StatelessWidget {
  const ToggleButtonWidget(
      {Key? key,
      required this.ontap,
      required this.primary,
      this.secundary,
      required this.background,
      required this.toggleValue})
      : super(key: key);
  final bool toggleValue;
  final Color background;
  final Color primary;
  final Color? secundary;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: 36,
        width: 284,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: background,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeIn,
              left: toggleValue ? 0 : 142.0,
              right: toggleValue ? 142 : 0,
              child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 400),
                  child: toggleValue
                      ? Container(
                          key: UniqueKey(),
                          width: 142,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(20)),
                        )
                      : Container(
                          key: UniqueKey(),
                          width: 142,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(20)),
                        )),
            ),
            Container(
              width: 284,
              height: 36,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: toggleValue ? () {} : ontap,
                      child: Text(
                        'Essenciais',
                        style: toggleValue
                            ? AppTextStyles.textWhite14px
                            : AppTextStyles.textBlack14px,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: toggleValue ? ontap : () {},
                      child: Text(
                        'Documentação',
                        style: toggleValue
                            ? AppTextStyles.textBlack14px
                            : AppTextStyles.textWhite14px,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
