import 'package:flutter/material.dart';
import 'package:shopapp/common/colors.dart';

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

    return Scaffold(
        backgroundColor: AppColor.bg,
        body: SizedBox(
            height: h,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 45, 0, 0),
                  height: h * 0.4,
                  decoration: BoxDecoration(color: AppColor.third),
                  child: Container(
                    padding: EdgeInsets.only(left: 8, bottom: 13),
                    width: w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Royal Shopping AAA ",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        TabBar(
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
                    Column(
                      children: [
                        Container(
                          height: h * 0.402,
                          color: AppColor.secondary,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Latest Shoes",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                                Text("See All",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: h * 0.15,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: h * 0.402,
                          color: AppColor.secondary,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: h * 0.402,
                          color: AppColor.secondary,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: h * 0.402,
                          color: AppColor.secondary,
                        ),
                      ],
                    )
                  ]),
                ),
              ],
            )));
  }
}
