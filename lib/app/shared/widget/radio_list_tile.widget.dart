import 'package:flutter/material.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/config.model.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/theme.model.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/text.widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// * Override RadioTileWidget with Value Index Number (int) instead using T Class

Widget radioListTileWidget({
  required int value,
  required int? groupValue,
  required void Function(int?)? onChanged,
  required String label,
  bool selected = false,
  required ConfigModel config,
}) {
  ThemeModel theme = ConfigCore.listSupportedThemes[config.themeSelected];
  return Theme(
    data: ThemeData(
      unselectedWidgetColor: Colors.grey,
      hoverColor: theme.hoverColor,
    ),
    child: RadioListTile(
      tileColor: theme.backgroundColor,
      activeColor: theme.primaryColor,
      onChanged: onChanged,
      groupValue: groupValue,
      value: value,
      title: textWidget(label: label, textSize: 14.sp, config: config),
      selected: selected,
    ),
  );
}
