import 'package:flutter_sapa_traffic_counter/app/data/business/model/config.model.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/repository/config.repository.dart';
import 'package:flutter_sapa_traffic_counter/app/data/source/pref/model/config.pref_model.dart';
import 'package:pmvvm/pmvvm.dart';

enum ViewState { loading, error, content }

class ViewModelCore extends ViewModel {
  ConfigModel config = ConfigPrefModel.fromDefault().toConfigModel();
  ViewState viewState = ViewState.loading;

  final ConfigRepository configRepository;

  ViewModelCore(this.configRepository);

  @override
  Future<void> onBuild() async {
    super.onBuild();
    config = await configRepository.getConfig();
    notifyListeners();
  }

  void updateView(ViewState viewState) {
    this.viewState = viewState;
    notifyListeners();
  }
}
