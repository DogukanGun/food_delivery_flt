import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/entity/Food.dart';
import 'package:food_delivery_flt/entity/FoodBasket.dart';
import 'package:food_delivery_flt/ui/shopping_bag/ShoppingBagCubit.dart';
import 'package:food_delivery_flt/ui/widgets/FoodListItem.dart';

class ShoppingBag extends StatefulWidget {
  const ShoppingBag({Key? key}) : super(key: key);

  @override
  State<ShoppingBag> createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingBagCubit,List<FoodBasket>>(
      builder: (context,foods){
        return ListView.builder(
            itemCount: foods.length,
            shrinkWrap: true,
            itemBuilder: (context,index){
              var food = foods[index];
              var foodBasket = Food(
                  id: food.id.toString(),
                  food_name: food.food_name,
                  image_name: food.image_name,
                  price: food.price.toString());
              return FoodListItem(food: foodBasket,voidCallback: (){
              },);
            }
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
