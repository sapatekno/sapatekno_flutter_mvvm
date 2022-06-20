import 'package:flutter/material.dart';
import 'package:flutter_sapa_traffic_counter/app/core/easylocalization.core.dart';
import 'package:flutter_sapa_traffic_counter/app/core/materialapp.core/materialapp.core.view.dart';
import 'package:flutter_sapa_traffic_counter/app/core/screenutil.core.dart';

class WidgetCore extends StatelessWidget {
  const WidgetCore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return easyLocalizationCore(
      child: screenUtilInitConfig(
        builder: (context, child) => const MaterialAppCoreView(),
      ),
    );
  }
}
