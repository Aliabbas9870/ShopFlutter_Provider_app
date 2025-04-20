import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/common/colors.dart';
import 'package:shopapp/provider/main_view_provider.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key, this.icon, this.onTap});

  final void Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final provide=Provider.of<MainViewProvider>(context);
    return InkWell(
      onTap: onTap,
      hoverColor: AppColor.third,
      child: Icon(
        icon,
        color:  AppColor.bg,
      ),
    );
  }
}
