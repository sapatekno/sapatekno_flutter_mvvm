import 'package:flutter/material.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/config.model.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/theme.model.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/extension/string.extension.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/text.widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget appBarWidget({
  required String title,
  List<Widget>? actions,
  required ConfigModel config,
}) {
  ThemeModel theme = ConfigCore.listSupportedThemes[config.themeSelected];
  return AppBar(
    title: textWidget(
      label: title.toTitleCase(),
      textSize: 16.sp,
      config: config,
      textColor: Colors.white,
    ),
    backgroundColor: theme.primaryColor,
    actions: actions,
    elevation: 0,
  );
}
