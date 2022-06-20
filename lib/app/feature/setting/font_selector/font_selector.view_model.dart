import 'package:flutter_sapa_traffic_counter/app/core/view_model.core.dart';

class FontSelectorViewModel extends ViewModelCore {
  FontSelectorViewModel(super.configRepository);

  @override
  Future<void> onBuild() async {
    await super.onBuild();
    updateView(ViewState.content);
  }

  setFont(int? id) async {
    id ??= 0;

    config.fontSelected = id;
    await configRepository.setConfig(config);
    notifyListeners();
  }
}
