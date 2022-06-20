import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sapa_traffic_counter/app/core/materialapp.core/materialapp.core.view_model.dart';
import 'package:flutter_sapa_traffic_counter/app/core/route.core.dart';
import 'package:flutter_sapa_traffic_counter/app/core/view_model.core.dart';
import 'package:flutter_sapa_traffic_counter/app/data/source/hive/box/config.hive_box.dart';
import 'package:flutter_sapa_traffic_counter/app/data/source/pref/repository/config.pref_repository.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/home/home.view_model.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/setting/font_selector/font_selector.view_model.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/setting/language_selector/language_selector.view_model.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/setting/text_scale_selector/text_scale_selector.view_model.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/setting/theme_selector/theme_selector.view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModuleCore extends Module {
  @override
  List<Bind> get binds => [
        /// * Other Bindings
        AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()),
        Bind.factory((i) => ConfigHiveBox()),

        /// * Repository Bindings
        Bind.factory((i) => ConfigPrefRepository()),

        /// * ViewModel Bindings
        Bind.factory((i) => ViewModelCore(i())),
        Bind.factory((i) => FontSelectorViewModel(i())),
        Bind.factory((i) => HomeViewModel(i())),
        Bind.factory((i) => LanguageSelectorViewModel(i())),
        Bind.factory((i) => ThemeSelectorViewModel(i())),
        Bind.factory((i) => TextScaleSelectorViewModel(i())),
        Bind.factory((i) => MaterialAppCoreViewModel(i())),
      ];

  @override
  List<ModularRoute> get routes => RouteCore().routes;
}
