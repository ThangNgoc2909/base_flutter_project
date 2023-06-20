import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_spacing.dart';
import '../../constants/app_typography.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final Color? buttonColor;
  final Color? titleColor;
  final VoidCallback? onTap;

  const CommonButton({
    super.key,
    required this.title,
    this.buttonColor,
    this.titleColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: sp16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sp8),
          color: buttonColor ?? AppColors.mainColor,
        ),
        child: Center(
          child: Text(
            title,
            style: AppTypography.h6.copyWith(
              color: titleColor ?? AppColors.whiteColor,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}