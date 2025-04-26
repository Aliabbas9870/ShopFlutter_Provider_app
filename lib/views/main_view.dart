import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/common/bottom_navbar.dart';
import 'package:shopapp/common/colors.dart';
import 'package:shopapp/provider/main_view_provider.dart';
import 'package:shopapp/views/cart_view.dart';
import 'package:shopapp/views/favourit_view.dart';
import 'package:shopapp/views/home_view.dart';
import 'package:shopapp/views/search_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pageList = [
    HomeView(),
    CartView(),
   
    // ProductByCart(),
    HomeView(),
    SearchView(),
    FavouritView(),
    //  NotificationView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainViewProvider>(builder: (context, provid, child) {
      return Scaffold(
        backgroundColor: AppColor.third,
    
        body: pageList[provid.pageIndex],
        bottomNavigationBar: BottomNavBar(),
      );
    });
  }
}

