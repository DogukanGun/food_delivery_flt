
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/entity/Food.dart';

class HomeCubit extends Cubit<List<Food>>{

  HomeCubit():super(<Food>[]);

  Future<void> getAllFoods() async{
    var foods = <Food>[Food(id: 1, food_name: "Pizza", image_name: "Pizza.png", price: 12)];
    emit(foods);
  }
}