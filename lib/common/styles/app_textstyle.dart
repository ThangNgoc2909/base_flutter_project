import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_styles.dart';

class AppTextStyle {
  ///w300
  final TextStyle typos13w300 = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w300,
    color: $styles.colors.deepDark,
    fontSize: 13.sp,
  );

  ///w400
  final TextStyle typos14w400 = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: $styles.colors.deepDark,
    fontSize: 14.sp,
  );
  final TextStyle typos15w400 = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: $styles.colors.deepDark,
    fontSize: 15.sp,
  );
}
