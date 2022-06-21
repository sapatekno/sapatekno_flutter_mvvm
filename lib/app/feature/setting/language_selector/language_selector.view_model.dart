import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';
import 'package:flutter_sapa_traffic_counter/app/core/view_model.core.dart';

abstract class LanguageSelectorViewModel extends ViewModelCore {
  LanguageSelectorViewModel(super.configRepository);

  void setLanguage(int? id);
}

class LanguageSelectorViewModelImplementor extends ViewModelCore implements LanguageSelectorViewModel {
  LanguageSelectorViewModelImplementor(super.configRepository);

  @override
  Future<void> onBuild() async {
    await super.onBuild();
    updateView(ViewState.content);
  }

  void setLanguage(int? id) {
    id ??= 0;

    config.languageSelected = id;
    configRepository.setConfig(config);

    Locale localeSelected = ConfigCore.listsSupportedLocales.firstWhere((e) => e.id == id).toLocale();
    context.setLocale(localeSelected);
    notifyListeners();
  }
}
