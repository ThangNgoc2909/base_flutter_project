import 'package:auto_route/auto_route.dart';
import 'package:base_project/base/base_cubit/base_state.dart';
import 'package:base_project/features/authentication/login/bloc/login_cubit.dart';
import 'package:base_project/features/authentication/login/presentation/widgets/build_form_login.dart';
import 'package:base_project/features/authentication/login/presentation/widgets/build_login_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_spacing.dart';
import '../../../../common/constants/app_typography.dart';
import '../../../../common/constants/assets/assets.dart';
import '../../../../common/widgets/base/base_scaffold.dart';
import '../../../../common/widgets/button/common_button.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage, LoginCubit> {
  final _loginValidate = GlobalKey<FormState>();

  @override
  Widget buildPage(BuildContext context) {
    return BaseScaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: sp16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(sp124),
            Center(
              child: Assets.image(
                assetName: "lh_logo.png",
                height: sp124,
                width: sp124,
              ),
            ),
            Gap(48.h),
            const Text(
              'Đăng nhập',
              style: AppTypography.h2,
              textAlign: TextAlign.start,
            ),
            Gap(24.h),
            BuildFormLogin(formKey: _loginValidate),
            Gap(16.h),
            const BuildLoginAction(),
            Gap(38.h),
            CommonButton(
              title: "Đăng nhập",
              onTap: () {
                if (_loginValidate.currentState?.validate() ?? false) {}
              },
            ),
            Gap(100.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Bạn chưa có tài khoản?", style: AppTypography.p5),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    " Đăng ký ngay",
                    style:
                        AppTypography.p5.copyWith(color: AppColors.mainColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
