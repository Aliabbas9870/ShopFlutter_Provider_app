import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/common/colors.dart';

class ProductCard extends StatefulWidget {
  ProductCard(
      {super.key,
      required this.id,
      required this.name,
      required this.image,
      required this.category,
      required this.price});
  final String name;
  final String price;
  final String image;
  final String id;
  final String category;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    bool selected = true;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.fromLTRB(9, 0, 20, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: h,
          width: w * .6,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                color: AppColor.secondary,
                blurRadius: 0.6,
                offset: Offset(1, 1)),
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: h * 0.23,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: CachedNetworkImageProvider(widget.image))),
                  ),
                  Positioned(
                    right: 2,
                      child: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.favorite_border,   color: AppColor.bg,size: 33,),
                  ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style:
                          TextStyle(
                               color: AppColor.bg,
                            fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.category,
                      style:
                          TextStyle(
                               color: AppColor.bg,
                            fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style:
                          TextStyle(
                               color: AppColor.bg,
                            fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          "Colors",
                          style: TextStyle(
                            color: AppColor.bg,
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        ChoiceChip(
                          
                          label: Text(" "),
                          selected: selected,
                          visualDensity: VisualDensity.comfortable,
                          
                          selectedColor: AppColor.primary,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
