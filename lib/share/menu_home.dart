import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/model/main_shoe_model.dart';
import 'package:shopapp/provider/product_provider.dart';
import 'package:shopapp/provider/shoe_provider.dart';
import 'package:shopapp/share/new_shoes.dart';
import 'package:shopapp/share/product_card.dart';
import 'package:shopapp/views/product_by_cart.dart';
import 'package:shopapp/views/product_page.dart';

class MenuHome extends StatelessWidget {
  const MenuHome({super.key, required this.tabIndex});
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    final shoeProvider = Provider.of<ShoeProvider>(context);

    List<Shoe> shoesData;
    if (tabIndex == 0) {
      shoesData = shoeProvider.localShoe; // Shoes for category "localShoes"
    } else if (tabIndex == 1) {
      shoesData = shoeProvider.localManShoe; // Shoes for category "manShoe"
    } else if (tabIndex == 2) {
      shoesData = shoeProvider.localWomanShoe; // Shoes for category "womanShoe"
    } else {
      shoesData = shoeProvider.localkidShoe; // Shoes for category "kidShoe"
    }

    var productNotifier = Provider.of<ProductNotifier>(context);
    return Column(
      children: [
        // Horizontal list of featured shoes
        SizedBox(
          height: h * 0.402,
          child: ListView.builder(
            itemCount: shoesData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) {
              final shoe = shoesData[i];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductPage(shoe: shoe), // Pass the selected shoe
                    ),
                  );
                },
                child: ProductCard(
                  id: shoe.id,
                  name: shoe.name,
                  category: shoe.category,
                  price: shoe.price,
                  image: shoe.image,
                ),
              );
            },
          ),
        ),

        // Latest shoes section header
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Shoes",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductByCart(
                              tabIndex: tabIndex), // Pass the correct tabIndex
                        ),
                      );
                    },
                    child: Text(
                      "See All",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // Horizontal list of new shoes
        SizedBox(
          height: h * 0.13,
          child: ListView.builder(
            itemCount: shoesData.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) {
              final shoe = shoesData[i];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NewShoes(
                  w: w,
                  h: h,
                  imgUrl: shoe.image,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
