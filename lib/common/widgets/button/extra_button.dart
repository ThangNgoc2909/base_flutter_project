import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_spacing.dart';
import '../../constants/app_typography.dart';

class ExtraButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final bool largeButton;
  final Color? borderColor;
  final Widget? icon;
  final Color? bgColor;
  final EdgeInsetsGeometry? padding;

  const ExtraButton({
    Key? key,
    this.title,
    this.onTap,
    required this.largeButton,
    this.borderColor,
    this.icon,
    this.bgColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor: bgColor ?? AppColors.whiteColor,
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: sp16, vertical: sp12),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(sp8)),
          side: BorderSide(
              color: borderColor ?? AppColors.borderColor_2, width: 1)),
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
              style:
              (largeButton ? AppTypography.h6 : AppTypography.p5).copyWith(
                color: AppColors.blackColor,
              ),
            )
        ],
      ),
    );
  }
}
