import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';
import 'package:flutter_sapa_traffic_counter/app/core/stateless_view.core.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/setting/font_selector/font_selector.view_model.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/extension/string.extension.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/app_bar.widget.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/radio_list_tile.widget.dart';
import 'package:pmvvm/pmvvm.dart';

class FontSelectorView extends StatelessWidget {
  const FontSelectorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MVVM(
        view: () => _FontSelectorView(),
        viewModel: Modular.get<FontSelectorViewModel>(),
      );
}

class _FontSelectorView extends StatelessViewCore<FontSelectorViewModel> {
  @override
  PreferredSizeWidget? appBarView(BuildContext context, FontSelectorViewModel viewModel) => appBarWidget(
        title: "pilih tema",
        config: viewModel.config,
      );

  @override
  Widget contentView(BuildContext context, FontSelectorViewModel viewModel) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: listThemeOptions(context, viewModel),
    );
  }

  List<Widget> listThemeOptions(BuildContext context, FontSelectorViewModel viewModel) => ConfigCore.listSupportedFonts
      .map(
        (e) => radioListTileWidget(
          value: e.id,
          groupValue: viewModel.config.fontSelected,
          onChanged: (id) => viewModel.setFont(id),
          label: e.fontName.toTitleCase(),
          config: viewModel.config,
        ),
      )
      .toList();
}
