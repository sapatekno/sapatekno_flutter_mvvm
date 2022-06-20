import 'package:flutter_sapa_traffic_counter/app/data/business/model/config.model.dart';

class ConfigPrefModel {
  static const prefName = 'config';

  int fontSelected;
  int languageSelected;
  int themeSelected;
  int textScaleSelected;

  ConfigPrefModel({
    required this.fontSelected,
    required this.languageSelected,
    required this.themeSelected,
    required this.textScaleSelected,
  });

  /// * Set Default Variable
  factory ConfigPrefModel.fromDefault() => ConfigPrefModel(
        languageSelected: 0,
        themeSelected: 0,
        fontSelected: 0,
        textScaleSelected: 1,
      );

  factory ConfigPrefModel.fromJson(Map<String, dynamic> json) => ConfigPrefModel(
        languageSelected: json['languageSelected'],
        themeSelected: json['themeSelected'],
        fontSelected: json['fontSelected'],
        textScaleSelected: json['textScaledSelected'],
      );

  factory ConfigPrefModel.fromConfigModel(ConfigModel data) => ConfigPrefModel(
        languageSelected: data.languageSelected,
        themeSelected: data.themeSelected,
        fontSelected: data.fontSelected,
        textScaleSelected: data.textScaleSelected,
      );

  Map<String, dynamic> toJson() => {
        "languageSelected": languageSelected,
        "themeSelected": themeSelected,
        "fontSelected": fontSelected,
        "textScaledSelected": textScaleSelected,
      };

  ConfigModel toConfigModel() => ConfigModel(
        languageSelected: languageSelected,
        themeSelected: themeSelected,
        fontSelected: fontSelected,
        textScaleSelected: textScaleSelected,
      );
}
