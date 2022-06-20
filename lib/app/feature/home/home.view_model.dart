import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sapa_traffic_counter/app/core/route.core.dart';
import 'package:flutter_sapa_traffic_counter/app/core/view_model.core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends ViewModelCore {
  HomeViewModel(super.configRepository);

  @override
  void init() async {
    super.init();
    updateView(ViewState.content);
  }

  void clearPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  void setTheme() async {
    config.themeSelected = config.themeSelected == 0 ? 1 : 0;
    await configRepository.setConfig(config);
    notifyListeners();
  }

  void openLanguageSelectorView() async => await Modular.to.pushNamed(RouteCore.languageSelectorPath).then((value) => onBuild());

  void openThemeSelectorView() async => await Modular.to.pushNamed(RouteCore.themeSelectorPath).then((value) => onBuild());

  void openFontSelectorView() async => await Modular.to.pushNamed(RouteCore.fontSelectorPath).then((value) => onBuild());

  void openTextScaleSelectorView() async => await Modular.to.pushNamed(RouteCore.textScaleSelectorPath).then((value) => onBuild());
}
