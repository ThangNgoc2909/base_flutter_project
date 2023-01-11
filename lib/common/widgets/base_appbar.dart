import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/app_styles.dart';
import '../styles/app_textstyle.dart';

class BaseAppBar extends StatelessWidget {
  const BaseAppBar({
    Key? key,
    this.backgroundColor,
    this.title = '',
    this.textStyle,
    this.onTap,
    this.leadingIcon,
    required this.hasBack,
    this.trailingIcon,
    this.iconColor,
  }) : super(key: key);

  final Color? backgroundColor;
  final String title;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final Widget? leadingIcon;
  final bool hasBack;
  final Widget? trailingIcon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: backgroundColor ?? $styles.colors.white,
      title: Text(
        title,
        style: textStyle ?? $textStyle.typos15w400,
      ),
      leading: GestureDetector(
        onTap: () {
          if (hasBack) {
            context.router.pop();
          } else {
            onTap?.call();
          }
        },
        child: leadingIcon ??
            Icon(
              Icons.arrow_back_rounded,
              size: 24.sp,
              color: iconColor ?? $styles.colors.mediumWhite,
            ),
      ),
      actions: [
        trailingIcon ?? const SizedBox(),
        SizedBox(
          width: 15.w,
        ),
      ],
    );
  }
}
