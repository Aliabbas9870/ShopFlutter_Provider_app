
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/common/colors.dart';

class NewShoes extends StatelessWidget {
  const NewShoes({
    super.key,
    required this.w,
    required this.h, required this.imgUrl,
  });

  final double w;
  final double h;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            imgUrl,
      ),
    );
  }
}
