import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/model/main_shoe_model.dart';
import 'package:shopapp/provider/shoe_provider.dart';
import 'package:shopapp/share/new_shoes.dart';
import 'package:shopapp/share/product_card.dart';
import 'package:shopapp/views/product_by_cart.dart';
import 'package:shopapp/views/product_page.dart';

class WomanHome extends StatelessWidget {
  const WomanHome({super.key, required this.tabIndex});
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
        final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final shoe = Provider.of<ShoeProvider>(context);

    List<Shoe> shoesData;
    if (tabIndex == 0) {
      shoesData = shoe.localShoe; // Shoes for category "localShoes"
    } else if (tabIndex == 1) {
      shoesData = shoe.localManShoe; // Shoes for category "manShoe"
    } else if (tabIndex == 2) {
      shoesData = shoe.localWomanShoe; // Shoes for category "womanShoe"
    } else {
      shoesData = shoe.localkidShoe; // Shoes for category "kidShoe"
    }
    return  Column(
                        children: [
                          SizedBox(
                            height: h * 0.402,
                            child: ListView.builder(
                                itemCount: shoesData.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  final shoes = shoe.localWomanData[i];
                                  return GestureDetector(
                                     onTap: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(shoe: shoes), // Pass the selected shoe
                    ),
                  );
                },
                                    child: ProductCard(
                                      id: shoes.id.toString(),
                                      name: shoes.name.toString(),
                                      category: shoes.category.toString(),
                                      price: shoes.price.toString(),
                                      image: shoes.image.toString(),
                                    ),
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
                              builder: (context) => ProductByCart(tabIndex: 2,)));
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
                                itemCount: shoe.localWomanData.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, i) {
                                  final shoes = shoe.localWomanData[i];
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