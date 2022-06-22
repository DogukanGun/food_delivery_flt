
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/entity/DeleteFoodFromBasketRequest.dart';
import 'package:food_delivery_flt/entity/Food.dart';
import 'package:food_delivery_flt/entity/FoodBasket.dart';
import 'package:food_delivery_flt/network/FoodRepository.dart';

import '../../entity/AddFoodToBasketRequest.dart';

class SearchCubit extends Cubit<List<Food>>{
  SearchCubit():super(<Food>[]);

  var repo = FoodRepository();

  Future<void> getSearchList(String foodName) async{
    var foods = await repo.getAllFoods();
    var newFoodsList = <Food>[];
    if(foodName.isNotEmpty){
      for(int i=0;i<foods.length;i++){
        if(foods[i].food_name.contains(foodName)){
          newFoodsList.add(foods[i]);
        }
      }
      emit(newFoodsList);
    }else{
      emit(foods);
    }
  }

  Future<void> addFoodToBasket(Food food,String username,int foodAmount)async {
    var addFoodToBasketRequest = AddFoodToBasketRequest(
        food_name: food.food_name,
        image_name: food.image_name,
        price: int.parse(food.price),
        foodAmount: foodAmount,
        username: username);
    await repo.addFoodToBasket(addFoodToBasketRequest);
  }

}