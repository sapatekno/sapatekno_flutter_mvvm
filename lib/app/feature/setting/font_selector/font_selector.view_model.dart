import 'package:flutter_sapa_traffic_counter/app/core/view_model.core.dart';

abstract class FontSelectorViewModel extends ViewModelCore {
  FontSelectorViewModel(super.configRepository);

  void setFont(int? id);
}

class FontSelectorViewModelImplementor extends ViewModelCore implements FontSelectorViewModel {
  FontSelectorViewModelImplementor(super.configRepository);

  @override
  Future<void> onBuild() async {
    await super.onBuild();
    updateView(ViewState.content);
  }

  @override
  void setFont(int? id) async {
    id ??= 0;

    config.fontSelected = id;
    await configRepository.setConfig(config);
    notifyListeners();
  }
}
