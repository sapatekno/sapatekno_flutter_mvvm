import 'package:flutter_sapa_traffic_counter/app/core/view_model.core.dart';

class TextScaleSelectorViewModel extends ViewModelCore {
  TextScaleSelectorViewModel(super.configRepository);

  @override
  Future<void> onBuild() async {
    await super.onBuild();
    updateView(ViewState.content);
  }

  setTextScale(int? id) async {
    id ??= 0;

    config.textScaleSelected = id;
    await configRepository.setConfig(config);
    notifyListeners();
  }
}
