import 'package:flutter/material.dart';

import '../../res/color_resource.dart';

class AmountCounter extends StatefulWidget {
  int totalAmount;
  VoidCallback decrement;
  VoidCallback increment;

  AmountCounter({Key? key,required this.totalAmount,required this.increment, required this.decrement}) : super(key: key);

  @override
  State<AmountCounter> createState() => _AmountCounterState();
}

class _AmountCounterState extends State<AmountCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: (){
            widget.decrement.call();
          },
          style: ElevatedButton.styleFrom(
            primary: ColorResource.button_primary_color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
          ),
          child:const  Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(Icons.remove,color: Colors.black,),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: ColorResource.background_color,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(widget.totalAmount.toString()),
          ),
        ),
        ElevatedButton(
          onPressed: (){
            widget.increment.call();
          },
          style: ElevatedButton.styleFrom(
            primary: ColorResource.button_primary_color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
          ),
          child:const  Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(Icons.add,color: Colors.black,),
          ),
        ),
      ],
    );
  }
}
