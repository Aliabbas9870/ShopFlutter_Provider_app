import 'package:flutter/material.dart';
import 'package:shopapp/common/colors.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({super.key});

  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with SingleTickerProviderStateMixin {
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
            child: Stack(children: [
              Container(
                padding: EdgeInsets.fromLTRB(9, 50, 5, 0),
                height: h * 0.4,
                decoration: BoxDecoration(color: AppColor.third),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.close, color: AppColor.bg),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.shape_line_outlined,
                              color: AppColor.bg,
                            ),
                          ),
                        ],
                      ),
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
            
              Padding(
                padding: EdgeInsets.only(top: h * 0.2, left: 16, right: 16),
                child: TabBarView(controller: _tabController, children: [
                  Container(
                    color: AppColor.primary,
                    child: Center(
                      child: Text("Menue"),
                    ),
                  ),
                  Container(
                    color: AppColor.secondary,
                    child: Center(
                      child: Text("Menue"),
                    ),
                  ),
                  Container(
                    color: AppColor.secondary,
                    child: Center(
                      child: Text("Woman"),
                    ),
                  ),
                  Container(
                    color: AppColor.secondary,
                    child: Center(
                      child: Text("Kids"),
                    ),
                  ),
                ]),
              ),
            ])));
  }
}
