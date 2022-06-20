import 'package:flutter/material.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/font.model.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/language.model.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/text_scale.model.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/theme.model.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigCore {
  /// * MaterialApp Config
  static const String appTitle = "Sapa Traffic Counter";

  /// * Easy Localizations Config
  static List<LanguageModel> listsSupportedLocales = [
    LanguageModel(id: 0, locale: const Locale('en', 'US'), name: "english"),
    LanguageModel(id: 1, locale: const Locale('id', 'ID'), name: "indonesia"),
  ];
  static String localePath = "asset/lang";

  /// * Avaliable Fonts
  static List<FontModel> listSupportedFonts = [
    FontModel(id: 0, fontName: "roboto", textStyle: GoogleFonts.roboto()),
    FontModel(id: 1, fontName: "ubuntu", textStyle: GoogleFonts.ubuntu()),
    FontModel(id: 2, fontName: "montserrat", textStyle: GoogleFonts.montserrat()),
  ];

  /// * Avaliable Themes
  static List<ThemeModel> listSupportedThemes = [
    ThemeModel(
      id: 0,
      themeName: 'light',
      primaryColor: Colors.blue,
      secondaryColor: Colors.orange,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      hoverColor: const Color.fromRGBO(230, 230, 230, 1),
      isDarkTheme: false,
    ),
    ThemeModel(
      id: 1,
      themeName: 'dark',
      primaryColor: Colors.orange,
      secondaryColor: Colors.blue,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      hoverColor: const Color.fromRGBO(25, 25, 25, 1),
      isDarkTheme: true,
    ),
  ];

  /// * Avaliable Text Scale
  static List<TextScaleModel> listSupportedTextScale = [
    TextScaleModel(id: 0, textScaleName: '0.75', scaleFactor: 0.75),
    TextScaleModel(id: 1, textScaleName: '1', scaleFactor: 1),
    TextScaleModel(id: 2, textScaleName: '1.25', scaleFactor: 1.25),
  ];

  /// * ScreenUtil Config
  /// * Screen Set Scale 3x (1080x1920) Using 16:9 Ratio
  static const double screenWidth = 360;
  static const double screenHeight = 640;
}
