import 'package:flutter/material.dart';

import '../../entity/Food.dart';
import '../../network/EndPoints.dart';
import '../../res/color_resource.dart';
import '../../res/dimen_resource.dart';
import '../food_detail/FoodDetail.dart';

class FoodListItem extends StatefulWidget {
  Food food;
  VoidCallback voidCallback;

  FoodListItem({Key? key, required this.food, required this.voidCallback}) : super(key: key);

  @override
  State<FoodListItem> createState() => _FoodListItemState();
}

class _FoodListItemState extends State<FoodListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodDetail(food: widget.food,)));
      },
      child: SizedBox(
        height: 150,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 15.0,top: 10.0,bottom: 10.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
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
                    Spacer(),
                    ElevatedButton(
                      onPressed: (){
                        widget.voidCallback.call();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: ColorResource.button_primary_color,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
                      ),
                      child:const  Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(Icons.shopping_bag,color: Colors.black,),
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
