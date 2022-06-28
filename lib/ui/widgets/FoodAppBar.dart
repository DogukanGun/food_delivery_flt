import 'package:flutter/material.dart';


class FoodAppBar extends StatefulWidget {

  String title;
  bool saveButton;

  FoodAppBar({Key? key,required this.title,required this.saveButton}) : super(key: key);

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
      actions: [
        Visibility(
            visible: widget.saveButton,
            child: const Icon(Icons.save)
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}
