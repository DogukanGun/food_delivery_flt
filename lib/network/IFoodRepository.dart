
import 'package:food_delivery_flt/entity/AddFoodToBasketRequest.dart';
import 'package:food_delivery_flt/entity/DeleteFoodFromBasketRequest.dart';

import '../entity/Food.dart';

abstract class IFoodRepository{
  Future<List<Food>> getAllFoods();
  Future<void> addFoodToBasket(AddFoodToBasketRequest addFoodToBasketRequest);
  Future<List<Food>> getAllFoodsInBasket(String username);
  Future<void> deleteFoodFromBasket(DeleteFoodFromBasketRequest deleteFoodFromBasketRequest);
}