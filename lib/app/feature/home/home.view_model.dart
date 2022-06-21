import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sapa_traffic_counter/app/core/route.core.dart';
import 'package:flutter_sapa_traffic_counter/app/core/view_model.core.dart';

abstract class HomeViewModel extends ViewModelCore {
  HomeViewModel(super.configRepository);

  void openLanguageSelectorView();

  void openThemeSelectorView();

  void openFontSelectorView();

  void openTextScaleSelectorView();
}

class HomeViewModelImplementor extends ViewModelCore implements HomeViewModel {
  HomeViewModelImplementor(super.configRepository);

  @override
  void init() async {
    super.init();
    updateView(ViewState.content);
  }

  @override
  void openLanguageSelectorView() async => await Modular.to.pushNamed(RouteCore.languageSelectorPath).then((value) => onBuild());

  @override
  void openThemeSelectorView() async => await Modular.to.pushNamed(RouteCore.themeSelectorPath).then((value) => onBuild());

  @override
  void openFontSelectorView() async => await Modular.to.pushNamed(RouteCore.fontSelectorPath).then((value) => onBuild());

  @override
  void openTextScaleSelectorView() async => await Modular.to.pushNamed(RouteCore.textScaleSelectorPath).then((value) => onBuild());
}
