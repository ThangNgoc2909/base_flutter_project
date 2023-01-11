import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/app_styles.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    Key? key,
    this.backgroundColor,
    this.appBar,
    this.body,
    this.backgroundImage,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);

  final Color? backgroundColor;
  final Widget? appBar;
  final Widget? body;
  final String? backgroundImage;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: backgroundColor ?? $styles.colors.darkBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: appBar != null ? appBar! : const SizedBox.shrink(),
        ),
        body: Stack(
          children: [
            if ((backgroundImage ?? "").isNotEmpty)
              Container(
                height: 1.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(backgroundImage!),
                    fit: BoxFit.fill,
                  ),
                ),
              )
            else
              const SizedBox.shrink(),
            body ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
