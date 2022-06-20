import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';
import 'package:flutter_sapa_traffic_counter/app/core/view_model.core.dart';

class LanguageSelectorViewModel extends ViewModelCore {
  LanguageSelectorViewModel(super.configRepository);

  @override
  Future<void> onBuild() async {
    await super.onBuild();
    updateView(ViewState.content);
  }

  setLanguage(int? id) {
    id ??= 0;

    config.languageSelected = id;
    configRepository.setConfig(config);

    Locale localeSelected = ConfigCore.listsSupportedLocales.firstWhere((e) => e.id == id).toLocale();
    context.setLocale(localeSelected);
    notifyListeners();
  }
}
