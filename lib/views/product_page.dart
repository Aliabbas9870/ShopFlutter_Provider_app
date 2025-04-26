import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/common/colors.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
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
                              child: CachedNetworkImage(imageUrl: "https://www.nicepng.com/png/full/982-9821153_stylish-kids-shoes.png",fit: BoxFit.contain,),
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
                                bottom: 65,
                                left: 0,
                              
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List<Widget>.generate(
                                    
                                    
                                    4, (index) {
                                    
                                    return Container(
                                      margin: const EdgeInsets.all(2),
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: index == 0
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
                ],
              ),
            ))
      ]),
    );
  }
}
