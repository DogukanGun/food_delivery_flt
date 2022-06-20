
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/entity/Food.dart';
import 'package:food_delivery_flt/network/FoodRepository.dart';

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

}