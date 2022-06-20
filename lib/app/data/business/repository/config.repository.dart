import 'package:flutter_sapa_traffic_counter/app/data/business/model/config.model.dart';

abstract class ConfigRepository {
  Future<ConfigModel> getConfig();

  Future<bool> setConfig(ConfigModel configModel);
}
