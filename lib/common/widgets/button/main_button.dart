import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_spacing.dart';
import '../../constants/app_typography.dart';

class MainButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final bool largeButton;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final bool isDisable;

  const MainButton({
    Key? key,
    this.title,
    this.onTap,
    required this.largeButton,
    this.icon,
    this.padding,
    this.isDisable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor:
              isDisable ? AppColors.mainColor : AppColors.accentColor_3,
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: sp16, vertical: sp12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onPressed: () {
        onTap?.call();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon ?? const SizedBox.shrink(),
          if (icon != null && title != null) const SizedBox(width: sp8),
          if (title != null)
            Text(
              '$title',
              style: largeButton ? AppTypography.h6 : AppTypography.p5,
            )
        ],
      ),
    );
  }
}
