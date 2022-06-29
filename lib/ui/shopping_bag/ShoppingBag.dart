import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_flt/entity/Food.dart';
import 'package:food_delivery_flt/entity/FoodBasket.dart';
import 'package:food_delivery_flt/res/dimen_resource.dart';
import 'package:food_delivery_flt/ui/shopping_bag/ShoppingBagCubit.dart';
import 'package:food_delivery_flt/ui/widgets/FoodListItem.dart';
import 'package:lottie/lottie.dart';

import '../../res/color_resource.dart';
import '../order/OrderUIStep1.dart';

class ShoppingBag extends StatefulWidget {
  ShoppingBag({Key? key}) : super(key: key);

  late _ShoppingBagState state;

  @override
  State<ShoppingBag> createState(){
    state = _ShoppingBagState();
    return state;
  }

}

class _ShoppingBagState extends State<ShoppingBag>{

  List<FoodBasket> _oldList = <FoodBasket>[];

  void _delete(FoodBasket food){
    context.read<ShoppingBagCubit>().deleteFoodFromBasket(food);
  }

  int getTotalPrice(List<FoodBasket> foodBasket){
    int total = 0;
    for(FoodBasket foodBasket in foodBasket){
        total += (int.parse(foodBasket.foodAmount)*int.parse(foodBasket.price));
    }
    return total;
  }

  void changeProducts(){
    for(FoodBasket foodBasket in _oldList){
      context.read<ShoppingBagCubit>().deleteFoodFromBasket(foodBasket);
      var food = Food(
          id: foodBasket.id,
          food_name: foodBasket.food_name,
          image_name: foodBasket.image_name,
          price: foodBasket.price
      );
      context.read<ShoppingBagCubit>().addFoodToBasket(food,"Dogukan",int.parse(foodBasket.foodAmount));
    }
    Fluttertoast.showToast(
        msg: "Bag was updated.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorResource.secondary_color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingBagCubit,List<FoodBasket>>(
      builder: (context,foods){
        if(foods.isNotEmpty){
          _oldList = foods;
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView.builder(
                    itemCount: _oldList.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      var food = _oldList[index];
                      var foodBasket = Food(
                          id: food.id.toString(),
                          food_name: food.food_name,
                          image_name: food.image_name,
                          price: food.price.toString());
                      return FoodListItem(
                        totalAmount:int.parse(food.foodAmount),
                        food: foodBasket,
                        delete:(){_delete(food);},
                        purchaseAvailable:false,
                        purchase: (totalAmount){
                          _oldList[index].foodAmount = totalAmount.toString();
                        },
                      );
                    }
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        children: [
                          Text(
                            "Total price : ${getTotalPrice(foods)}",
                            style: TextStyle(fontSize: DimenResource.medium_text,fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child:
                          ElevatedButton(
                            onPressed: (){
                              Navigator.push(context,MaterialPageRoute(builder:(context)=>OrderUIStep1(foods: foods,)));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: ColorResource.button_primary_color,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
                            ),
                            child:const  Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text("Let's Buy"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Lottie.asset('asset/crying.json'),
              Text("Bag is empty",style: TextStyle(fontSize: DimenResource.big_text),)
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<ShoppingBagCubit>().getAllFoodsOfUser("Dogukan");
  }
}
