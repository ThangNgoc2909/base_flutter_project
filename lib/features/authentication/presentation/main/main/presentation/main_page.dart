import 'package:auto_route/auto_route.dart';
import 'package:base_project/common/widgets/base/base_appbar.dart';
import 'package:base_project/common/widgets/base/base_scaffold.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBar: BaseAppBar(
        hasBack: false,
        title: "Home Screen",
        hasArrow: false,
      ),
    );
  }
}
