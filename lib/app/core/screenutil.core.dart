import 'package:flutter/material.dart';
import 'package:flutter_sapa_traffic_counter/app/core/config.core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ScreenUtilInit screenUtilInitConfig({required Widget Function(BuildContext, Widget?) builder}) {
  return ScreenUtilInit(
    designSize: const Size(
      ConfigCore.screenWidth,
      ConfigCore.screenHeight,
    ),
    minTextAdapt: true,
    splitScreenMode: false,
    builder: builder,
  );
}
