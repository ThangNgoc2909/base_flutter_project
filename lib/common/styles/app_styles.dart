import 'package:dm_tool/common/styles/app_textstyle.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

final $styles = AppStyle();

@immutable
class AppStyle {
  final AppColors colors = AppColors();
  final AppTextStyle textStyle = AppTextStyle();
}
