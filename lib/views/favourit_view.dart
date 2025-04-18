import 'package:flutter/material.dart';

class FavouritView extends StatefulWidget {
  const FavouritView({super.key});

  @override
  State<FavouritView> createState() => _FavouritViewState();
}

class _FavouritViewState extends State<FavouritView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Favourite"),
    );
  }
}