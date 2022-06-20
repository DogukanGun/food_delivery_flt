import 'package:flutter/material.dart';
import 'package:food_delivery_flt/entity/Food.dart';
import 'package:food_delivery_flt/network/EndPoints.dart';
import 'package:food_delivery_flt/res/color_resource.dart';

class FoodCard extends StatelessWidget {

  Food food;
  double width;
  double height;

  FoodCard({Key? key, required this.food,required this.height,required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: ColorResource.button_primary_color,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                  width: width,
                  height: height,
                  child: Image.network(EndPoints.getImageFromService(food.image_name))
              ),
              const Spacer(),
              Text(food.food_name,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ],
          ),
        )
      ),
    );
  }
}
