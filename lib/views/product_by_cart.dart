import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/common/category_btn.dart';
import 'package:shopapp/common/colors.dart';
import 'package:shopapp/common/kid_product.dart';
import 'package:shopapp/common/man_product.dart';
import 'package:shopapp/common/menu_product.dart';
import 'package:shopapp/common/woman_product.dart';
import 'package:shopapp/provider/shoe_provider.dart';
import 'package:shopapp/views/main_view.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({super.key, required this.tabIndex});
  final int tabIndex;

  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: widget.tabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final menu = Provider.of<ShoeProvider>(context);
    final man = Provider.of<ManShoeProvider>(context);
    final kid = Provider.of<KidsShoeProvider>(context);

    final woman = Provider.of<WomanShoeProvider>(context);
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
                            onTap: () {
                              Get.to(() => MainView(),
                                  transition: Transition.leftToRight,
                                  duration: Duration(seconds: 2));
                            },
                            child: Icon(Icons.close, color: AppColor.bg),
                          ),
                          GestureDetector(
                            onTap: () {
                              filter();
                            },
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
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: TabBarView(controller: _tabController, children: [
                    ManuProduct(shoe: menu),
                    ManProduct(
                      shoe: man,
                    ),
                    WomanProduct(shoe: woman),
                    KidProduct(shoe: kid)
                  ]),
                ),
              ),
            ])));
  }

  Future<dynamic> filter() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.82,
              decoration: BoxDecoration(
                  color: AppColor.bg,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14))),
              child: Column(children: [
                SizedBox(
                  // height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Filter",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CategoryBtn(label: "Man", btnColor: AppColor.primary),
                          CategoryBtn(
                              label: "woman", btnColor: AppColor.primary),
                          CategoryBtn(label: "kid", btnColor: AppColor.primary),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CategoryBtn(
                              label: "Shoes", btnColor: AppColor.primary),
                          CategoryBtn(
                              label: "trend", btnColor: AppColor.primary),
                          CategoryBtn(
                              label: "news", btnColor: AppColor.primary),
                        ],
                      ),
                    ],
                  ),
                )
              ]));
        });
  }
}
