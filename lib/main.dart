import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sapa_traffic_counter/app/core/module.core.dart';
import 'package:flutter_sapa_traffic_counter/app/core/widget.core.dart';
import 'package:flutter_sapa_traffic_counter/app/data/source/hive/box/config.hive_box.dart';
import 'package:flutter_sapa_traffic_counter/app/data/source/hive/model/config.hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  /// * To Make Sure All Bindings Initialized Before Start
  WidgetsFlutterBinding.ensureInitialized();

  /// * Easy Localization Init (Language & Locale)
  await EasyLocalization.ensureInitialized();

  /// * Hive Database initialization
  /// * Get app directory (Not working on Web)
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  /// * Hive Box Init & Adapter
  Hive.registerAdapter(ConfigHiveModelAdapter());

  /// * Call ConfigBox for Setting
  await ConfigHiveBox().init();

  return runApp(
    ModularApp(
      module: ModuleCore(),
      child: const WidgetCore(),
    ),
  );
}
