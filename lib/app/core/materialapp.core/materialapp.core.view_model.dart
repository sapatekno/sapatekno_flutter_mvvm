import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';
import 'package:flutter_sapa_traffic_counter/app/core/view_model.core.dart';

class MaterialAppCoreViewModel extends ViewModelCore {
  MaterialAppCoreViewModel(super.configRepository);

  @override
  void init() async {
    super.init();
    config = await configRepository.getConfig();
    setInitialLocalization();
    notifyListeners();
  }

  void setInitialLocalization() {
    Locale localeSelected = ConfigCore.listsSupportedLocales.firstWhere((e) => e.id == config.languageSelected).toLocale();
    context.setLocale(localeSelected);
  }
}
