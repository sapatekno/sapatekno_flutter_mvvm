import 'package:flutter_sapa_traffic_counter/app/core/view_model.core.dart';

class ThemeSelectorViewModel extends ViewModelCore {
  ThemeSelectorViewModel(super.configRepository);

  @override
  Future<void> onBuild() async {
    await super.onBuild();
    updateView(ViewState.content);
  }

  setTheme(int? id) async {
    id ??= 0;

    config.themeSelected = id;
    await configRepository.setConfig(config);
    notifyListeners();
  }
}
