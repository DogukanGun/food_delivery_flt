import 'package:flutter/material.dart';
import 'package:food_delivery_flt/res/color_resource.dart';


class FoodAppBar extends StatefulWidget {

  String title;
  bool saveButton;
  VoidCallback voidCallback;

  FoodAppBar({Key? key,required this.title,required this.saveButton,required this.voidCallback}) : super(key: key);

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
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Visibility(
              visible: widget.saveButton,
              child: IconButton(
                  onPressed: (){widget.voidCallback.call();},
                  icon: const Icon(Icons.save,color: Colors.black,)
              )
          ),
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}
