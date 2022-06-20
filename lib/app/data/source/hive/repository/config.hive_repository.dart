import 'package:flutter_sapa_traffic_counter/app/data/business/model/config.model.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/repository/config.repository.dart';
import 'package:flutter_sapa_traffic_counter/app/data/source/hive/box/config.hive_box.dart';
import 'package:flutter_sapa_traffic_counter/app/data/source/hive/model/config.hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ConfigHiveRepository implements ConfigRepository {
  ConfigHiveBox box;

  ConfigHiveRepository(this.box);

  late Box<ConfigHiveModel> client;

  Future<void> init() async => client = await box.init();

  static ConfigModel getListenableConfig(Box box) {
    ConfigHiveModel data = box.get(0, defaultValue: ConfigHiveModel.defaultValue());
    ConfigModel result = data.toConfigModel();
    return result;
  }

  @override
  Future<ConfigModel> getConfig() async {
    await init();
    ConfigHiveModel? data = client.get(0, defaultValue: ConfigHiveModel.defaultValue());
    ConfigModel result = data!.toConfigModel();
    return result;
  }

  @override
  Future<bool> setConfig(ConfigModel configModel) async {
    await init();
    return true;
  }
}
