import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sapa_traffic_counter/app/core/stateless_view.core.dart';
import 'package:flutter_sapa_traffic_counter/app/core/view_model.core.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/about/about.page.dart';
import 'package:flutter_sapa_traffic_counter/app/feature/home/home.view_model.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/extension/string.extension.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/app_bar.widget.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/button.widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pmvvm/pmvvm.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MVVM(
        view: () => _HomeView(),
        viewModel: Modular.get<HomeViewModel>(),
      );
}

class _HomeView extends StatelessViewCore<HomeViewModel> {
  @override
  PreferredSizeWidget? appBarView(BuildContext context, HomeViewModel viewModel) {
    return appBarWidget(
      title: "app_name".tr().toTitleCase(),
      actions: viewModel.viewState == ViewState.content
          ? [
              IconButton(onPressed: () => viewModel.openThemeSelectorView(), icon: const Icon(Icons.light_mode)),
              IconButton(onPressed: () => viewModel.openLanguageSelectorView(), icon: const Icon(Icons.language)),
              IconButton(onPressed: () => viewModel.openFontSelectorView(), icon: const Icon(Icons.font_download)),
              IconButton(onPressed: () => viewModel.openTextScaleSelectorView(), icon: const Icon(Icons.text_increase)),
            ]
          : null,
      config: viewModel.config,
    );
  }

  @override
  Widget contentView(BuildContext context, HomeViewModel viewModel) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(height: 8.r),
        buttonWidget(
          label: "continue_project".tr().toTitleCase(),
          iconData: Icons.arrow_circle_right,
          margin: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
          onPressed: () {},
          backgroundColor: Colors.red,
          textColor: Colors.white,
          labelFontWeight: FontWeight.bold,
          config: viewModel.config,
        ),
        buttonWidget(
          label: "new_project".tr().toTitleCase(),
          iconData: Icons.start,
          margin: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
          onPressed: null,
          config: viewModel.config,
        ),
        buttonWidget(
          label: "project_history".tr().toTitleCase(),
          iconData: Icons.history,
          onPressed: () => viewModel.clearPref(),
          margin: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
          config: viewModel.config,
        ),
        buttonWidget(
          label: "about_application".tr().toTitleCase(),
          iconData: Icons.info,
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AboutPage())),
          margin: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          config: viewModel.config,
        ),
      ],
    );
  }

  languageSelectorDialog(BuildContext context) {}
}
