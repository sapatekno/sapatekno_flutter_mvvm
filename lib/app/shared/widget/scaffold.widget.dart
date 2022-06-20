import 'package:flutter/material.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/config.model.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/theme.model.dart';

Scaffold scaffoldWidget({
  required ConfigModel config,
  PreferredSizeWidget? appBar,
  Widget? body,
}) {
  ThemeModel theme = ConfigCore.listSupportedThemes[config.themeSelected];
  return Scaffold(
    backgroundColor: theme.backgroundColor,
    appBar: appBar,
    body: body,
  );
}
