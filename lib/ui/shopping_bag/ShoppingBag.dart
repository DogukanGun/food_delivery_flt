import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/entity/Food.dart';
import 'package:food_delivery_flt/entity/FoodBasket.dart';
import 'package:food_delivery_flt/ui/search/SearchCubit.dart';
import 'package:food_delivery_flt/ui/shopping_bag/ShoppingBagCubit.dart';
import 'package:food_delivery_flt/ui/widgets/FoodListItem.dart';

import '../../res/color_resource.dart';

class ShoppingBag extends StatefulWidget {
  const ShoppingBag({Key? key}) : super(key: key);

  @override
  State<ShoppingBag> createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {

  void _delete(FoodBasket food){
    context.read<ShoppingBagCubit>().deleteFoodFromBasket(food);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingBagCubit,List<FoodBasket>>(
      builder: (context,foods){
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListView.builder(
                  itemCount: foods.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    var food = foods[index];
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
                      },
                    );
                  }
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child:
                        ElevatedButton(
                          onPressed: (){
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
              ),
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
