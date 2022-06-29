
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/entity/Food.dart';
import 'package:food_delivery_flt/entity/FoodBasket.dart';
import 'package:food_delivery_flt/network/FoodRepository.dart';

import '../../entity/AddFoodToBasketRequest.dart';
import '../../entity/DeleteFoodFromBasketRequest.dart';

class ShoppingBagCubit extends Cubit<List<FoodBasket>>{

  ShoppingBagCubit():super(<FoodBasket>[]);

  var repo = FoodRepository();

  Future<void> getAllFoodsOfUser(String username)async {
    var basketFoodsRepo = await repo.getAllFoodsInBasket(username);
    emit(basketFoodsRepo);
  }

  Future<void> deleteFoodFromBasket(FoodBasket foodBasket) async{
    var deleteFoodFromBasket = DeleteFoodFromBasketRequest(
        id: int.parse(foodBasket.id),
        username: foodBasket.username
    );
    await repo.deleteFoodFromBasket(deleteFoodFromBasket);
    var foods = await repo.getAllFoodsInBasket(deleteFoodFromBasket.username);
    emit(foods);
  }

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