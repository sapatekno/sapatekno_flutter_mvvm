import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sapa_traffic_counter/app/core/module.core.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/model/config.model.dart';
import 'package:flutter_sapa_traffic_counter/app/data/business/repository/config.repository.dart';
import 'package:flutter_sapa_traffic_counter/app/data/source/pref/model/config.pref_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigPrefRepository extends ConfigRepository {
  late SharedPreferences pref;

  Future<void> init() async {
    await Modular.isModuleReady<ModuleCore>();
    pref = Modular.get<SharedPreferences>();
  }

  @override
  Future<ConfigModel> getConfig() async {
    ConfigModel? result;

    await init();
    String? source = pref.getString(ConfigPrefModel.prefName);

    if (source != null) {
      ConfigPrefModel configPref = ConfigPrefModel.fromJson(jsonDecode(source));
      result = configPref.toConfigModel();
    } else {
      ConfigModel configModel = ConfigPrefModel.fromDefault().toConfigModel();
      await setConfig(configModel);
      result = await getConfig();
    }

    return result;
  }

  @override
  Future<bool> setConfig(ConfigModel configModel) async {
    await init();
    var source = ConfigPrefModel.fromConfigModel(configModel).toJson();
    pref.setString(ConfigPrefModel.prefName, jsonEncode(source));
    return true;
  }
}
