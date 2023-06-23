import 'dart:async';
import 'dart:math';
import 'package:base_project/common/constants/app_typography.dart';
import 'package:flutter/material.dart';
import '../common/constants/app_colors.dart';
import '../common/constants/app_size_device.dart';
import '../common/constants/app_spacing.dart';
import '../common/constants/assets/assets.dart';
import '../common/widgets/base/base_loading.dart';
import '../common/widgets/button/extra_button.dart';
import '../common/widgets/button/main_button.dart';

class DialogUtils {
  const DialogUtils._();

  static FutureOr showSuccessDialog(
    BuildContext context, {
    required String content,
    VoidCallback? accept,
    VoidCallback? extraAccept,
    String? mainTitle,
    String? extraTitle,
    bool hasButton = true,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: sp32),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: sp24, horizontal: sp16),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(sp8),
            ),
            width: max(widthDevice(context) - sp32, 343),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.whiteColor,
                  child: Assets.icon(assetName: "ic_success.svg"),
                ),
                const SizedBox(height: sp24),
                const Text('Thông báo', style: AppTypography.h3),
                const SizedBox(height: sp12),
                Text(
                  content,
                  style: AppTypography.p4.copyWith(color: AppColors.greyColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: sp24),
                hasButton
                    ? Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: ExtraButton(
                              title: extraTitle ?? 'Quay lại',
                              onTap: () {
                                extraAccept != null
                                    ? extraAccept.call()
                                    : Navigator.of(context).pop();
                              },
                              borderColor: AppColors.borderColor_4,
                              largeButton: true,
                              icon: null,
                            ),
                          ),
                          const SizedBox(width: sp12),
                          Expanded(
                            child: MainButton(
                              title: mainTitle ?? 'Xác nhận',
                              onTap: () {
                                accept?.call();
                              },
                              largeButton: true,
                              icon: null,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }

  static FutureOr showErrorDialog(
    BuildContext context, {
    required String content,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: sp32),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: sp24, horizontal: sp16),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(sp8),
            ),
            width: max(widthDevice(context) - sp32, 343),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.whiteColor,
                  child: Assets.icon(assetName: "ic_error.svg"),
                ),
                const SizedBox(height: sp24),
                const Text('Thông báo', style: AppTypography.h3),
                const SizedBox(height: sp12),
                Text(
                  content,
                  style: AppTypography.p4.copyWith(color: AppColors.greyColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static FutureOr showLoadingDialog(
    BuildContext context, {
    required String message,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: sp24, horizontal: sp16),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(sp8),
            ),
            width: max(widthDevice(context) - sp32, 343),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const BaseLoading(),
                const SizedBox(height: sp24),
                const Text('Thông báo', style: AppTypography.h3),
                const SizedBox(height: sp12),
                Text(
                  message,
                  style: AppTypography.p4.copyWith(
                    color: AppColors.greyColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
