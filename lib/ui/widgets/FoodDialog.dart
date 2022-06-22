import 'package:flutter/material.dart';

import 'AmountCounter.dart';

class FoodDialog extends StatefulWidget {
  int totalAmount;
  VoidCallback popCallback;
  Function(int) purchase;

  FoodDialog({Key? key,required this.purchase, required this.totalAmount, required this.popCallback}) : super(key: key);

  @override
  State<FoodDialog> createState() => _FoodDialogState();
}

class _FoodDialogState extends State<FoodDialog> {
  void _decrement(){
    if(widget.totalAmount>1){
      setState((){widget.totalAmount -= 1;});
    }
  }

  void _increment(){
    setState((){widget.totalAmount += 1;});
  }



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Food Amount"),
      content: AmountCounter(
                totalAmount: widget.totalAmount,
                increment: _increment,
                decrement: _decrement
              ),
      actions: <Widget>[
        TextButton(
            onPressed: (){
              widget.popCallback.call();
            },
            child: const Text("Cancel")
        ),
        TextButton(
            onPressed: (){
              widget.popCallback.call();
              widget.purchase.call(widget.totalAmount);
            },
            child: const Text("Buy")
        ),
      ],
    );
  }
}
