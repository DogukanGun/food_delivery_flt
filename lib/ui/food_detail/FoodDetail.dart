import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/network/EndPoints.dart';
import 'package:food_delivery_flt/res/dimen_resource.dart';
import 'package:food_delivery_flt/res/str_resource.dart';
import 'package:food_delivery_flt/ui/food_detail/FoodDetailCubit.dart';

import '../../entity/Food.dart';
import '../../res/color_resource.dart';

class FoodDetail extends StatefulWidget {
  Food food;
  FoodDetail({Key? key,required this.food}) : super(key: key);

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {

  int totalAmount = 0;

  void _decrement(){
    if(totalAmount>0){
      totalAmount -= 1;
    }
  }

  void _increment(){
    totalAmount += 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.food.food_name.toUpperCase(),style:  TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(EndPoints.getImageFromService(widget.food.image_name)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState((){_decrement();});
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorResource.button_primary_color,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
                  ),
                  child:const  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(Icons.remove,color: Colors.black,),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: ColorResource.background_color,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(totalAmount.toString()),
                    ),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState((){_increment();});
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorResource.button_primary_color,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
                  ),
                  child:const  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(Icons.add,color: Colors.black,),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ColorResource.secondary_color,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text("4.9",style: TextStyle(fontSize: DimenResource.medium_text,color: Colors.white),),
                          const Icon(Icons.star,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                  Text("Free Shipping",style: TextStyle(fontSize: DimenResource.medium_text),),
                  Text("30 min",style: TextStyle(fontSize: DimenResource.medium_text),),
                ],
              ),
            ),
            const Padding(
              padding:  EdgeInsets.all(20.0),
              child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",style: TextStyle(),textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Total Price"),
                      Text("${(int.parse(widget.food.price) * totalAmount)} TL")
                    ],
                  ),
                  ElevatedButton(
                    onPressed: (){
                      context.read<FoodDetailCubit>().addFoodToBasket(widget.food, "Dogukan", totalAmount);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: ColorResource.button_primary_color,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
                    ),
                    child:const  Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Icon(Icons.shopping_bag,color: Colors.black,),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
