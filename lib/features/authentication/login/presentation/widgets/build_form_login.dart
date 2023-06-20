import 'package:base_project/common/constants/app_spacing.dart';
import 'package:base_project/features/authentication/login/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/app_typography.dart';
import '../../../../../common/widgets/textfield/validate_textfield.dart';
import '../../bloc/login_cubit.dart';

class BuildFormLogin extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const BuildFormLogin({Key? key, required this.formKey}) : super(key: key);

  @override
  State<BuildFormLogin> createState() => _BuildFormLoginState();
}

class _BuildFormLoginState extends State<BuildFormLogin> {
  late LoginCubit bloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc = context.read<LoginCubit>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tài khoản',
            style: AppTypography.p5,
            textAlign: TextAlign.start,
          ),
          Gap(8.h),
          ValidateTextField(
            margin: EdgeInsets.zero,
            backgroundColor: AppColors.whiteColor,
            hintText: "Nhập tài khoản",
            hintStyle: AppTypography.p6.copyWith(color: AppColors.greyColor),
            maxLines: 1,
            onChanged: (value) {
              bloc.onChangeAccount(value);
            },
            validator: (value) {
              if (value?.isEmpty ?? false) {
                return "Hãy nhập tài khoản";
              }
              return null;
            },
          ),
          Gap(16.h),
          const Text(
            'Mật khẩu',
            style: AppTypography.p5,
            textAlign: TextAlign.start,
          ),
          Gap(8.h),
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) =>
                previous.obscureText != current.obscureText,
            builder: (context, state) {
              return ValidateTextField(
                margin: EdgeInsets.zero,
                backgroundColor: AppColors.whiteColor,
                hintText: "Nhập mật khẩu",
                hintStyle:
                    AppTypography.p6.copyWith(color: AppColors.greyColor),
                onChanged: (value) {
                  bloc.onChangePassword(value);
                },
                obscureText: state.obscureText,
                suffixIcon: GestureDetector(
                  onTap: () {
                    bloc.onChangeVisibility();
                  },
                  child: Icon(
                    state.obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.greyColor,
                    size: sp20,
                  ),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return "Hãy nhập mật khẩu";
                  }
                  return null;
                },
              );
            },
          )
        ],
      ),
    );
  }
}
