import 'package:flutter/foundation.dart';
import 'package:flutter_sapa_traffic_counter/app/data/source/hive/model/config.hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ConfigHiveBox {
  static String boxName = "config";

  Future<Box<ConfigHiveModel>> init() async => await Hive.openBox<ConfigHiveModel>(boxName);

  static ValueListenable listen() => Hive.box<ConfigHiveModel>(boxName).listenable();
}
