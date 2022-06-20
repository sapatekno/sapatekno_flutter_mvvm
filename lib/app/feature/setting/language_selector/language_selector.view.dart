import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';
import 'package:flutter_sapa_traffic_counter/app/core/stateless_view.core.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/setting/language_selector/language_selector.view_model.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/extension/string.extension.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/app_bar.widget.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/radio_list_tile.widget.dart';
import 'package:pmvvm/pmvvm.dart';

class LanguageSelectorView extends StatelessWidget {
  const LanguageSelectorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MVVM(
        view: () => _LanguageSelectorView(),
        viewModel: Modular.get<LanguageSelectorViewModel>(),
      );
}

class _LanguageSelectorView extends StatelessViewCore<LanguageSelectorViewModel> {
  @override
  PreferredSizeWidget? appBarView(BuildContext context, LanguageSelectorViewModel viewModel) {
    return appBarWidget(
      title: "select_language".tr().toTitleCase(),
      config: viewModel.config,
    );
  }

  @override
  Widget contentView(BuildContext context, LanguageSelectorViewModel viewModel) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: listLanguageOptions(context, viewModel),
    );
  }

  List<Widget> listLanguageOptions(BuildContext context, LanguageSelectorViewModel viewModel) => ConfigCore.listsSupportedLocales
      .map((e) => radioListTileWidget(
            value: e.id,
            groupValue: viewModel.config.languageSelected,
            onChanged: (id) => viewModel.setLanguage(id),
            label: e.name.tr().toTitleCase(),
            selected: viewModel.config.languageSelected == e.id,
            config: viewModel.config,
          ))
      .toList();
}
