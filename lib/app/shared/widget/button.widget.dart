import 'package:flutter/material.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/config.model.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/theme.model.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/text.widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buttonWidget({
  required ConfigModel config,
  required VoidCallback? onPressed,
  required String label,
  double? labelFontSize,
  TextAlign? textAlign,
  FontWeight? labelFontWeight,
  double borderRadius = double.maxFinite,
  Color? backgroundColor,
  Color? textColor,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? buttonPadding,
  IconData? iconData,
}) {
  /// * Default Value
  labelFontSize ??= 12.sp;
  buttonPadding ??= EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r);
  margin ??= EdgeInsets.zero;

  ThemeModel theme = ConfigCore.listSupportedThemes[config.themeSelected];

  return Padding(
    padding: margin,
    child: TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              width: 2.r,
              color: theme.isDarkTheme ? (backgroundColor ?? theme.primaryColor) : Colors.transparent,
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          Color color = theme.isDarkTheme ? theme.backgroundColor : (backgroundColor ?? theme.primaryColor);

          if (states.contains(MaterialState.pressed)) {
            return color.withOpacity(0.5);
          } else if (states.contains(MaterialState.disabled)) {
            return theme.isDarkTheme ? Colors.grey.shade800 : Colors.grey; // Disabled color
          }
          return color; // Regular color
        }),
        padding: MaterialStateProperty.resolveWith((states) => buttonPadding),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          iconData != null
              ? Padding(
                  padding: EdgeInsets.only(right: 12.r),
                  child: Icon(
                    iconData,
                    color: theme.isDarkTheme ? (backgroundColor ?? theme.primaryColor) : (textColor ?? Colors.white),
                    size: 16.r,
                  ),
                )
              : Container(),
          Expanded(
            child: textWidget(
              label: label,
              textSize: labelFontSize,
              config: config,
              fontWeight: labelFontWeight,
              textColor: theme.isDarkTheme ? (backgroundColor ?? theme.primaryColor) : (textColor ?? Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
