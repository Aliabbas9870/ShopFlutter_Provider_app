import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/share/colors.dart';
import 'package:shopapp/views/main_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.off(() => MainView(),
          transition: Transition.leftToRightWithFade,
          duration: Duration(seconds: 3));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: AppColor.bg),
        child: Center(
          child: Text(
            "Welcome",
            style: TextStyle(
                decoration: TextDecoration.none, color: AppColor.primary),
          ),
        ),
      ),
    );
  }
}
