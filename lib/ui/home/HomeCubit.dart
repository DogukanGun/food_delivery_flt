
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/entity/Food.dart';
import 'package:food_delivery_flt/network/FoodRepository.dart';

class HomeCubit extends Cubit<List<Food>>{

  HomeCubit():super(<Food>[]);

  var repo = FoodRepository();

  Future<void> getAllFoods() async{
    var foods = await repo.getAllFoods();
    emit(foods);
  }

}