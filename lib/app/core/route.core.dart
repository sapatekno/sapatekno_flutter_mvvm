import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/home/home.view.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/setting/font_selector/font_selector.view.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/setting/language_selector/language_selector.view.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/setting/text_scale_selector/text_scale_selector.view.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/setting/theme_selector/theme_selector.view.dart';

class RouteCore {
  /// * Define Path Name
  static String defaultPath = "/";
  static String languageSelectorPath = "/language/selector";
  static String themeSelectorPath = "/theme/selector";
  static String fontSelectorPath = "/font/selector";
  static String textScaleSelectorPath = "/text_scale/selector";

  List<ModularRoute> get routes => [
        ChildRoute(defaultPath, child: (context, args) => const HomeView()),
        ChildRoute(languageSelectorPath, child: (context, args) => const LanguageSelectorView()),
        ChildRoute(themeSelectorPath, child: (context, args) => const ThemeSelectorView()),
        ChildRoute(fontSelectorPath, child: (context, args) => const FontSelectorView()),
        ChildRoute(textScaleSelectorPath, child: (context, args) => const TextScaleSelectorView()),
      ];
}
