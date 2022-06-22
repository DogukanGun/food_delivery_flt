import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_flt/ui/widgets/AmountCounter.dart';
import 'package:food_delivery_flt/ui/widgets/FoodDialog.dart';

import '../../entity/Food.dart';
import '../../network/EndPoints.dart';
import '../../res/color_resource.dart';
import '../../res/dimen_resource.dart';
import '../food_detail/FoodDetail.dart';

class FoodListItem extends StatefulWidget {
  int totalAmount;
  bool purchaseAvailable;
  Food food;
  Function(int) purchase;
  VoidCallback delete;

  FoodListItem({Key? key,required this.totalAmount, required this.food, required this.purchase,required this.purchaseAvailable,required this.delete}) : super(key: key);

  @override
  State<FoodListItem> createState() => _FoodListItemState();
}

class _FoodListItemState extends State<FoodListItem> {
  final TextEditingController _controller = TextEditingController();
  bool errorTextActive = false;

  void _decrement(){
    if(widget.totalAmount>1){
      setState((){widget.totalAmount -= 1;});
    }else{
      widget.delete.call();
    }
  }

  void _increment(){
    setState((){widget.totalAmount += 1;});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodDetail(food: widget.food,)));
      },
      child: SizedBox(
        height: 180,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 15.0,top: 10.0,bottom: 10.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Image.network(EndPoints.getImageFromService(widget.food.image_name)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.food.food_name,
                      style: TextStyle(
                          fontSize: DimenResource.small_text,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "${widget.food.price} TL",
                      style: TextStyle(
                          fontSize: DimenResource.small_text,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    const Spacer(),
                    Visibility(
                      visible: !widget.purchaseAvailable,
                      child: Row(
                        children: [
                          AmountCounter(
                              totalAmount: widget.totalAmount,
                              increment: _increment,
                              decrement: _decrement
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: widget.purchaseAvailable,
                      child: ElevatedButton(
                        onPressed: (){
                          showDialog(context: context, builder: (BuildContext buildContext){
                            return FoodDialog(
                                purchase:(amount){} ,
                                totalAmount: widget.totalAmount,
                                popCallback: (){Navigator.pop(context);}
                            );
                          }
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: ColorResource.button_primary_color,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
                        ),
                        child:const  Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(Icons.shopping_bag,color: Colors.black,),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
