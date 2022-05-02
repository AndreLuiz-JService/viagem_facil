import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridViewModel extends GetxController {
  final String? imagem;
  final Color cor;
  final Color? cor2;
  final String icon;
  final String text;
  final String? text2;
  final String? textObrigatorio;
  final String? textSugestao;
  final String? title;
  GridViewModel({this.title ,required this.cor,required this.icon, this.imagem, required this.text, this.text2,this.cor2,this.textObrigatorio,this.textSugestao});
  
} 