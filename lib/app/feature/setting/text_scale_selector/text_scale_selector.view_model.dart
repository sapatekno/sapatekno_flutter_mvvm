import 'package:flutter_sapa_traffic_counter/app/core/view_model.core.dart';

abstract class TextScaleSelectorViewModel extends ViewModelCore {
  TextScaleSelectorViewModel(super.configRepository);

  void setTextScale(int? id);
}

class TextScaleSelectorViewModelImplementor extends ViewModelCore implements TextScaleSelectorViewModel {
  TextScaleSelectorViewModelImplementor(super.configRepository);

  @override
  Future<void> onBuild() async {
    await super.onBuild();
    updateView(ViewState.content);
  }

  @override
  void setTextScale(int? id) async {
    id ??= 0;

    config.textScaleSelected = id;
    await configRepository.setConfig(config);
    notifyListeners();
  }
}
