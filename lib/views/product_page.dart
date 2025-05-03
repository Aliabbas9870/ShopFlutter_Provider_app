import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/model/main_shoe_model.dart';
import 'package:shopapp/provider/product_provider.dart';
import 'package:shopapp/share/colors.dart';

class ProductPage extends StatefulWidget {
  final Shoe shoe;

  const ProductPage({super.key, required this.shoe});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<ProductNotifier>(builder: (ctx, productNotifier, child) {
      return CustomScrollView(slivers: [
        SliverAppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            title: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.more_horiz_sharp,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            pinned: true,
            snap: false,
            floating: true,
            backgroundColor: Colors.transparent,
            expandedHeight: MediaQuery.of(context).size.height,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      controller: pageController,
                      onPageChanged: (page) {
                        setState(() {
                          productNotifier.activePage =
                              page; // Update the current page index
                          // Update the current page index
                        });
                      },
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.39,
                              width: MediaQuery.of(context).size.width,
                              color: AppColor.bg,
                              child: CachedNetworkImage(
                                imageUrl: widget.shoe.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              right: 13,
                              top: 68,
                              child: Icon(
                                Icons.favorite,
                                color: AppColor.primary,
                                size: 30,
                              ),
                            ),
                            Positioned(
                                // bottom: 5,
                                top: 255,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List<Widget>.generate(4, (index) {
                                    return Container(
                                      margin: const EdgeInsets.all(2),
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color:
                                            productNotifier.activePage != index
                                                ? AppColor.primary
                                                : AppColor.secondary,
                                        shape: BoxShape.circle,
                                      ),
                                    );
                                  }),
                                )),
                          ],
                        );
                      },
                    ),
                  ),
                  Positioned(
                      bottom: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.shoe.name,
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Text(widget.shoe.category,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 20,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: AppColor.primary,
                                        size: 15,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("\$" + widget.shoe.price + ".00",
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: AppColor.primary,
                                            fontWeight: FontWeight.bold)),
                                    Row(
                                      children: [
                                        Text("Colors",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: AppColor.primary,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 17,
                                          width: 17,
                                          decoration: BoxDecoration(
                                              color: AppColor.primary,
                                              shape: BoxShape.circle),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 17,
                                          width: 17,
                                          decoration: BoxDecoration(
                                              color: AppColor.secondary,
                                              shape: BoxShape.circle),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 17,
                                          width: 17,
                                          decoration: BoxDecoration(
                                              color: AppColor.bg,
                                              shape: BoxShape.circle),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Column(
                                  children: [
                                   
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ))
      ]);
    }));
  }
}
