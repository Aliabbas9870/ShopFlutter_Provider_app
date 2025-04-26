import 'package:flutter/material.dart';
import 'package:shopapp/common/stager_tile.dart';
import 'package:shopapp/provider/shoe_provider.dart';

class WomanProduct extends StatelessWidget {
  const WomanProduct({
    super.key,
    required this.shoe,
  });

  final WomanShoeProvider shoe;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 9,
        crossAxisSpacing: 10,
        mainAxisExtent:   220,
    
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, i) {
         final shoes = shoe.localWomanData[i];
        return StagerTile(
          imgUrl:
              shoes.image, 
          name: shoes.name,
          price:"\$ "+ shoes.price, 
        );
      },
      itemCount: shoe.localWomanData.length,
    );
  }
}