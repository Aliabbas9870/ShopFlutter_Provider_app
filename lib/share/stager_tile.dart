import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/share/colors.dart';

class StagerTile extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String price;
  const StagerTile(
      {super.key,
      required this.imgUrl,
      required this.name,
      required this.price});

  @override
  State<StagerTile> createState() => _StagerTileState();
}

class _StagerTileState extends State<StagerTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
          decoration: BoxDecoration(
              color: AppColor.secondary,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.imgUrl,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: EdgeInsets.only(top: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColor.bg,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.price,
                        style: TextStyle(fontSize: 14, color: AppColor.bg),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
