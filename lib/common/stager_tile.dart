import 'package:flutter/material.dart';

class StagerTile extends StatefulWidget {
  const StagerTile({super.key});

  @override
  State<StagerTile> createState() => _StagerTileState();
}

class _StagerTileState extends State<StagerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Padding(padding: EdgeInsets.all(8),)
    );
  }
}
