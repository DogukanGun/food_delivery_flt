
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/entity/FoodBasket.dart';
import 'package:food_delivery_flt/network/FoodRepository.dart';

import '../../entity/DeleteFoodFromBasketRequest.dart';

class OrderUIStep2Cubit extends Cubit<void>{

  OrderUIStep2Cubit():super(0);

  var repo = FoodRepository();

  Future<void> deleteFoodsFromBasket(FoodBasket foodBasket) async{
    var deleteFoodFromBasket = DeleteFoodFromBasketRequest(
        id: int.parse(foodBasket.id),
        username: foodBasket.username
    );
    await repo.deleteFoodFromBasket(deleteFoodFromBasket);
  }
}