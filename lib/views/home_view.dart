import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/common/colors.dart';
import 'package:shopapp/common/product_card.dart';
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
                    Container(
                      padding: EdgeInsets.only(left: 12),
                      child: Column(
                        children: [
                          SizedBox(
                            height: h * 0.402,
                            child: ListView.builder(
                                itemCount: shoe.localData.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  final shoes = shoe.localData[i];
                                  return ProductCard(
                                    id: shoes.id.toString(),
                                    name: shoes.name.toString(),
                                    category: shoes.category.toString(),
                                    price: shoes.price.toString(),
                                    image: shoes.image.toString(),
                                    
                                  );
                                }),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 20, 12, 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: h * 0.13,
                            child: ListView.builder(
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: w * 0.28,
                                      height: h * 0.12,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColor.primary,
                                                blurRadius: 0.7,
                                                offset: Offset(0, 1))
                                          ],
                                          color: AppColor.bg,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12))),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://th.bing.com/th/id/OIP.umB_odF1-OC8eg6ZVimSUQHaHa?w=980&h=980&rs=1&pid=ImgDetMain',
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
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
