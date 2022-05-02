import 'package:flutter/material.dart';
import 'package:viagem_facil/shared/themes/app_colors.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';

class StackBottom extends StatelessWidget {
  const StackBottom({
    Key? key,
    required this.size,
    required this.image,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Stack( 
        children: [
          Container(
            width: size.width * 0.28,
            height: 78,
            color: Colors.transparent,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width * 0.28,
              height: 55,
              color: AppColors.bottomSheet,
            ),
          ),
          Container(
            height: 55,
            width: size.width * 0.28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.bottomSheet,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primary),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(image,color: Colors.white,),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            child: Container(
              width: size.width * 0.28,
              child: Text(
                text,
                style: AppTextStyles.textPurple13px,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );
  }
}