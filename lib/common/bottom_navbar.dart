import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/common/bottom_nav_bar_widget.dart';
import 'package:shopapp/common/colors.dart';
import 'package:shopapp/provider/main_view_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Consumer<MainViewProvider>(builder: (context,provid,child){
      return 
    SafeArea(
      
      child: Container(
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.third,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavBarWidget(
              icon: provid.pageIndex == 0
                  ? Icons.home_filled
                  : Icons.home_outlined,
              onTap: () {
                provid.pageIdex = 0;
              },
            ),
            BottomNavBarWidget(
              onTap: () {
                provid.pageIdex = 1;
              },
              icon: provid.pageIndex == 1
                  ? Icons.shop_rounded
                  : Icons.shop_outlined,
            ),
            BottomNavBarWidget(
              onTap: () {
                provid.pageIdex = 2;
              },
              icon:
                  provid.pageIndex == 2 ? Icons.add : Icons.add_box_rounded,
            ),
            BottomNavBarWidget(
              onTap: () {
                provid.pageIdex = 3;
              },
              icon: provid.pageIndex == 3 ? Icons.search : Icons.search_off,
            ),
            BottomNavBarWidget(
              onTap: () {
                provid.pageIdex = 4;
              },
                   icon: provid.pageIndex == 4
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
          ],
        ),
      ),
    );
    });
  }
}
