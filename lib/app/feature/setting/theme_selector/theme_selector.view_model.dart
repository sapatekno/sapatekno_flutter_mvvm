import 'package:flutter_sapa_traffic_counter/app/core/view_model.core.dart';

abstract class ThemeSelectorViewModel extends ViewModelCore {
  ThemeSelectorViewModel(super.configRepository);

  void setTheme(int? id);
}

class ThemeSelectorViewModelImplementor extends ViewModelCore implements ThemeSelectorViewModel {
  ThemeSelectorViewModelImplementor(super.configRepository);

  @override
  Future<void> onBuild() async {
    await super.onBuild();
    updateView(ViewState.content);
  }

  @override
  void setTheme(int? id) async {
    id ??= 0;

    config.themeSelected = id;
    await configRepository.setConfig(config);
    notifyListeners();
  }
}
