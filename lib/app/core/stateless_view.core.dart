import 'package:flutter/material.dart';
import 'package:flutter_sapa_traffic_counter/app/core/view_model.core.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/error.widget.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/loading.widget.dart';
import 'package:flutter_sapa_traffic_counter/app/shared/widget/scaffold.widget.dart';
import 'package:pmvvm/pmvvm.dart';

abstract class StatelessViewCore<T extends ViewModelCore> extends StatelessView<T> {
  const StatelessViewCore({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context, T viewModel) {
    return scaffoldWidget(
      config: viewModel.config,
      appBar: appBarView(context, viewModel),
      body: viewModel.viewState == ViewState.loading
          ? loadingView(context, viewModel)
          : viewModel.viewState == ViewState.content
              ? contentView(context, viewModel)
              : errorView(context, viewModel),
    );
  }

  PreferredSizeWidget? appBarView(BuildContext context, T viewModel);

  Widget loadingView(BuildContext context, T viewModel) => loadingWidget();

  Widget contentView(BuildContext context, T viewModel);

  Widget errorView(BuildContext context, T viewModel) => errorWidget();
}
