import 'package:flutter/material.dart';


class FoodAppBar extends StatefulWidget {

  String title;

  FoodAppBar({Key? key,required this.title}) : super(key: key);

  @override
  State<FoodAppBar> createState() => _FoodAppBarState();
}

class _FoodAppBarState extends State<FoodAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Hello ${widget.title}",
        style:  const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}
