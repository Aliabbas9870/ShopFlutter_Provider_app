import 'package:flutter/material.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({super.key, required this.label, required this.btnColor, this.onPressed});
  final String label;
  final Color btnColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.23,
        decoration: BoxDecoration(
            border: Border.all(width: 1,color: btnColor),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
