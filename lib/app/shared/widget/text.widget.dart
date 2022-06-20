import 'package:flutter/material.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/config.model.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/theme.model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget textWidget({
  required String label,
  EdgeInsets margin = EdgeInsets.zero,
  double? textSize,
  Color? textColor,
  TextAlign? textAlign,
  FontWeight? fontWeight,
  required ConfigModel config,
}) {
  /// * Default Value
  textSize ??= 12.sp;

  ThemeModel theme = ConfigCore.listSupportedThemes[config.themeSelected];
  TextStyle textStyle = ConfigCore.listSupportedFonts.firstWhere((e) => e.id == config.fontSelected).toTextStyle();
  double textScaleFactor = ConfigCore.listSupportedTextScale.firstWhere((e) => e.id == config.textScaleSelected).scaleFactor;

  return Padding(
    padding: margin,
    child: Text(
      label,
      textAlign: textAlign,
      style: textStyle.copyWith(
        fontSize: textSize * textScaleFactor,
        color: textColor ?? theme.textColor,
        fontWeight: fontWeight,
      ),
    ),
  );
}
