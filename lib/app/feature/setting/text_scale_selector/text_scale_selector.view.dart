import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';
import 'package:flutter_sapa_traffic_counter/app/core/stateless_view.core.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/setting/text_scale_selector/text_scale_selector.view_model.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/extension/string.extension.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/app_bar.widget.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/radio_list_tile.widget.dart';
import 'package:pmvvm/pmvvm.dart';

class TextScaleSelectorView extends StatelessWidget {
  const TextScaleSelectorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MVVM(
        view: () => _TextScaleSelectorView(),
        viewModel: Modular.get<TextScaleSelectorViewModel>(),
      );
}

class _TextScaleSelectorView extends StatelessViewCore<TextScaleSelectorViewModel> {
  @override
  PreferredSizeWidget? appBarView(BuildContext context, TextScaleSelectorViewModel viewModel) => appBarWidget(
        title: 'select_scale_factor',
        config: viewModel.config,
      );

  @override
  Widget contentView(BuildContext context, TextScaleSelectorViewModel viewModel) => ListView(
        physics: const BouncingScrollPhysics(),
        children: listTextScaleOptions(context, viewModel),
      );

  List<Widget> listTextScaleOptions(BuildContext context, TextScaleSelectorViewModel viewModel) => ConfigCore.listSupportedTextScale
      .map(
        (e) => radioListTileWidget(
          value: e.id,
          groupValue: viewModel.config.textScaleSelected,
          onChanged: (id) => viewModel.setTextScale(id),
          label: e.textScaleName.toTitleCase(),
          selected: viewModel.config.textScaleSelected == e.id,
          config: viewModel.config,
        ),
      )
      .toList();
}
