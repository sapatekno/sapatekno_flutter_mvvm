import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';
import 'package:flutter_sapa_traffic_counter/app/core/materialapp.core/materialapp.core.view_model.dart';
import 'package:flutter_sapa_traffic_counter/app/core/stateless_view.core.dart';
import 'package:pmvvm/pmvvm.dart';

class MaterialAppCoreView extends StatelessWidget {
  const MaterialAppCoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MVVM(
        view: () => _MaterialAppCoreView(),
        viewModel: Modular.get<MaterialAppCoreViewModel>(),
      );
}

class _MaterialAppCoreView extends StatelessViewCore<MaterialAppCoreViewModel> {
  @override
  PreferredSizeWidget? appBarView(BuildContext context, MaterialAppCoreViewModel viewModel) => null;

  @override
  Widget contentView(BuildContext context, MaterialAppCoreViewModel viewModel) => Container();

  @override
  Widget render(BuildContext context, MaterialAppCoreViewModel viewModel) {
    return MaterialApp.router(
      title: ConfigCore.appTitle,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
