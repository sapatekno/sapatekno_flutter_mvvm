import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';

EasyLocalization easyLocalizationCore({required Widget child}) {
  return EasyLocalization(
    supportedLocales: ConfigCore.listsSupportedLocales.map((e) => e.toLocale()).toList(),
    path: ConfigCore.localePath,
    child: child,
  );
}
