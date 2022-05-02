import 'package:flutter/material.dart';
import 'package:viagem_facil/shared/themes/app_images.dart';
import 'package:viagem_facil/shared/themes/app_text_styles.dart';

class TopBar_home extends StatelessWidget {
  const TopBar_home({
    Key? key,
    required this.imagen,
    required this.text,
  }) : super(key: key);

  final String imagen;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          Container(
            width: 63.0,
            height: 63.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new AssetImage(imagen),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                text,
                style: AppTextStyles.textWhite10px,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
