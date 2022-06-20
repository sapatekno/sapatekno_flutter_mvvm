import 'package:flutter_sapa_traffic_counter/app/data/business/model/config.model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'config.hive_model.g.dart';

@HiveType(typeId: 1)
class ConfigHiveModel {
  @HiveField(0, defaultValue: 0)
  final int languageSelected;
  @HiveField(1, defaultValue: 0)
  final int themeSelected;
  @HiveField(2, defaultValue: 0)
  final int fontSelected;
  @HiveField(3, defaultValue: 0)
  final int textScaleSelected;

  ConfigHiveModel({
    required this.languageSelected,
    required this.themeSelected,
    required this.fontSelected,
    required this.textScaleSelected,
  });

  static ConfigHiveModel defaultValue() => ConfigHiveModel(
        languageSelected: 0,
        themeSelected: 0,
        fontSelected: 0,
        textScaleSelected: 1,
      );

  ConfigModel toConfigModel() => ConfigModel(
        languageSelected: languageSelected,
        themeSelected: themeSelected,
        fontSelected: fontSelected,
        textScaleSelected: textScaleSelected,
      );
}
