import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/share/colors.dart';
import 'package:shopapp/provider/main_view_provider.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key, this.icon, this.onTap});

  final void Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final provide=Provider.of<MainViewProvider>(context);
    return Container(
      padding: EdgeInsets.all(6),
      decoration:  BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        hoverColor: AppColor.third,
        child: Icon(
          icon,
          color:  AppColor.bg,
        ),
      ),
    );
  }
}
