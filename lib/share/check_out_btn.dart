
import 'package:flutter/material.dart';
import 'package:shopapp/share/colors.dart';

class CheckOutBtn extends StatelessWidget {
  const CheckOutBtn({
    super.key, this.onTap, required this.label,
  });
  final void Function()? onTap;

final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: MediaQuery.of(context)
                  .size
                  .width *
              0.9,
          decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius:
                  BorderRadius.circular(
                      20)),
          child: Center(
            child: Text(label.toString(),
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight:
                        FontWeight.bold)),
          ),
        ));
  }
}
