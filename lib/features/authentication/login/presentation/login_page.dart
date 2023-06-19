import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_spacing.dart';
import '../../../../common/constants/app_typography.dart';
import '../../../../common/widgets/base/base_scaffold.dart';
import '../../../../gen/assets.gen.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? username, password;

  final _loginValidate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: sp16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Center(
                child: Assets.images.lhLogo.image(
                  width: 130.w,
                  height: 130.h,
                ),
              ),
              SizedBox(
                height: 48.h,
              ),
              const Text('Đăng nhập',
                  style: AppTypography.h2, textAlign: TextAlign.start),
              SizedBox(
                height: 24.h,
              ),
              // buildFormLogin(context, _loginValidate, _loginController.username,
              //     _loginController.password),
              SizedBox(
                height: 16.h,
              ),
              // buildMoreActionLogin(),
              SizedBox(
                height: 38.h,
              ),
              // buildLoginButton(context, _loginValidate),
              SizedBox(height: 124.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Bạn chưa có tài khoản?", style: AppTypography.p5),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      " Đăng ký ngay",
                      style:
                          AppTypography.p5.copyWith(color: AppColors.mainColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
