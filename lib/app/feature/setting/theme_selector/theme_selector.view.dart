import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';
import 'package:flutter_sapa_traffic_counter/app/core/stateless_view.core.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/setting/theme_selector/theme_selector.view_model.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/extension/string.extension.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/app_bar.widget.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/radio_list_tile.widget.dart';
import 'package:pmvvm/pmvvm.dart';

class ThemeSelectorView extends StatelessWidget {
  const ThemeSelectorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MVVM(
        view: () => _ThemeSelectorView(),
        viewModel: Modular.get<ThemeSelectorViewModel>(),
      );
}

class _ThemeSelectorView extends StatelessViewCore<ThemeSelectorViewModel> {
  @override
  PreferredSizeWidget? appBarView(BuildContext context, ThemeSelectorViewModel viewModel) {
    return appBarWidget(
      title: "select_theme".tr().toTitleCase(),
      config: viewModel.config,
    );
  }

  @override
  Widget contentView(BuildContext context, ThemeSelectorViewModel viewModel) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: listThemeOptions(context, viewModel),
    );
  }

  List<Widget> listThemeOptions(BuildContext context, ThemeSelectorViewModel viewModel) => ConfigCore.listSupportedThemes
      .map((e) => radioListTileWidget(
            value: e.id,
            groupValue: viewModel.config.themeSelected,
            onChanged: (id) => viewModel.setTheme(id),
            label: e.themeName.toTitleCase(),
            selected: viewModel.config.themeSelected == e.id,
            config: viewModel.config,
          ))
      .toList();
}
