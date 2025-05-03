import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/share/colors.dart';
import 'package:shopapp/share/kid_home.dart';
import 'package:shopapp/share/man_home.dart';
import 'package:shopapp/share/menu_home.dart';
import 'package:shopapp/share/woman_home.dart';
import 'package:shopapp/provider/shoe_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final shoe = Provider.of<ShoeProvider>(context);

    return Scaffold(
        backgroundColor: AppColor.bg,
        body: SizedBox(
            height: h,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(9, 50, 5, 0),
                  height: h * 0.4,
                  decoration: BoxDecoration(color: AppColor.third),
                  child: Container(
                    padding: EdgeInsets.only(left: 8, bottom: 10, top: 20),
                    width: w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Royal Shopping AAA ",
                          style: TextStyle(
                              color: AppColor.bg,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TabBar(
                            padding: EdgeInsets.zero,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.transparent,
                            controller: _tabController,
                            labelColor: AppColor.bg,
                            labelStyle: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                            isScrollable: true,
                            unselectedLabelColor: AppColor.secondary,
                            tabs: const [
                              Tab(
                                text: "Menue",
                              ),
                              Tab(
                                text: "Man",
                              ),
                              Tab(
                                text: "Woman",
                              ),
                              Tab(
                                text: "Kids",
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.265),
                  child: TabBarView(controller: _tabController, children: [
                    MenuHome(
                      tabIndex: 0,
                    ),
                    ManHome(
                      tabIndex: 1,
                    ),
                    WomanHome(
                      tabIndex: 2,
                    ),
                    KidHome(
                      tabIndex: 3,
                    )
                  ]),
                ),
              ],
            )));
  }
}
