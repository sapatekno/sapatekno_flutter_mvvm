import 'package:flutter/material.dart';

class ThemeModel {
  int id;
  bool isDarkTheme;
  String themeName;
  Color primaryColor;
  Color secondaryColor;
  Color backgroundColor;
  Color hoverColor;
  Color textColor;

  ThemeModel({
    required this.id,
    required this.isDarkTheme,
    required this.themeName,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.hoverColor,
    required this.textColor,
  });
}
