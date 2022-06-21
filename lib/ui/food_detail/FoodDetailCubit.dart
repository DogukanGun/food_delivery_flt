
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/entity/AddFoodToBasketRequest.dart';
import 'package:food_delivery_flt/entity/Food.dart';
import 'package:food_delivery_flt/network/FoodRepository.dart';

class FoodDetailCubit extends Cubit<List<Food>>{

  FoodDetailCubit():super(<Food>[]);

  var repo = FoodRepository();

  Future<void> addFoodToBasket(Food food,String username,int foodAmount) async {
    var addFoodToBasketRequest = AddFoodToBasketRequest(
        food_name: food.food_name,
        image_name: food.image_name,
        price: int.parse(food.price),
        foodAmount: foodAmount,
        username: username);
    await repo.addFoodToBasket(addFoodToBasketRequest);
  }

}