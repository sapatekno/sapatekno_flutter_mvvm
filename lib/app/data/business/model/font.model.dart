import 'package:flutter/material.dart';

class FontModel {
  int id;
  String fontName;
  TextStyle textStyle;

  FontModel({
    required this.id,
    required this.fontName,
    required this.textStyle,
  });

  TextStyle toTextStyle() => textStyle;
}
