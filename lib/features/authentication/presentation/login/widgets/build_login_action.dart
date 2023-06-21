import 'package:base_project/common/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../common/constants/app_colors.dart';
import '../../../../../common/constants/app_typography.dart';
import '../../../../../common/widgets/common/base_check_box.dart';
import '../bloc/login_cubit.dart';
import '../bloc/login_state.dart';

class BuildLoginAction extends StatefulWidget {
  const BuildLoginAction({Key? key}) : super(key: key);

  @override
  State<BuildLoginAction> createState() => _BuildLoginActionState();
}

class _BuildLoginActionState extends State<BuildLoginAction> {
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
    return Row(
      children: [
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (previous, current) =>
              previous.isRemember != current.isRemember,
          builder: (context, state) {
            return BaseCheckbox(
              value: state.isRemember,
              onChanged: (bool? value) {},
            );
          },
        ),
        const Gap(sp8),
        Text(
          "Nhớ tài khoản",
          style: AppTypography.p5.copyWith(
            color: AppColors.greyColor,
          ),
        ),
        const Spacer(),
        Text(
          "Quên mật khẩu",
          style: AppTypography.p5.copyWith(
            color: AppColors.greyColor,
          ),
        ),
      ],
    );
  }
}
