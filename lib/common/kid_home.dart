import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/common/new_shoes.dart';
import 'package:shopapp/common/product_card.dart';
import 'package:shopapp/provider/shoe_provider.dart';
import 'package:shopapp/views/product_by_cart.dart';

class KidHome extends StatelessWidget {
  const KidHome({super.key, required this.tabIndex});
  final int tabIndex;
  

  @override
  Widget build(BuildContext context) {
        final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final shoe = Provider.of<KidsShoeProvider>(context);
    return  Column(
                        children: [
                          SizedBox(
                            height: h * 0.402,
                            child: ListView.builder(
                                itemCount: shoe.localKidData.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  final shoes = shoe.localKidData[i];
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
                                   GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductByCart(tabIndex: tabIndex,)));
                    },
                    child: Text("See All",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: h * 0.13,
                            child: ListView.builder(
                                itemCount: shoe.localKidData.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  final shoes = shoe.localKidData[i];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: NewShoes(
                                      w: w,
                                      h: h,
                                      imgUrl: shoes.image,
                                    ),
                                  );
                                }),
                          )
                        ],
    );
                    

  }
}