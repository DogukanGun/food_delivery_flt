
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/entity/Food.dart';
import 'package:food_delivery_flt/entity/FoodBasket.dart';
import 'package:food_delivery_flt/network/FoodRepository.dart';

class ShoppingBagCubit extends Cubit<List<FoodBasket>>{

  ShoppingBagCubit():super(<FoodBasket>[]);

  var repo = FoodRepository();

  Future<void> getAllFoodsOfUser(String username)async {
    var basketFoodsRepo = await repo.getAllFoodsInBasket(username);
    emit(basketFoodsRepo);
  }
}