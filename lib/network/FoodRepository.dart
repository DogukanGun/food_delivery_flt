
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:food_delivery_flt/entity/Food.dart';
import 'package:food_delivery_flt/entity/FoodBasket.dart';
import 'package:food_delivery_flt/entity/FoodBasketResponse.dart';
import 'package:food_delivery_flt/entity/FoodResponse.dart';
import 'package:food_delivery_flt/network/EndPoints.dart';
import 'package:food_delivery_flt/network/IFoodRepository.dart';

import '../entity/AddFoodToBasketRequest.dart';
import '../entity/DeleteFoodFromBasketRequest.dart';

class FoodRepository extends IFoodRepository{

  var endPoints = EndPoints();

  @override
  Future<void> addFoodToBasket(AddFoodToBasketRequest addFoodToBasketRequest) async {
    var data = addFoodToBasketRequest.toJson();
    var response = await Dio().post(endPoints.getAddFoodToBasket(),data: FormData.fromMap(data));
  }

  @override
  Future<void> deleteFoodFromBasket(DeleteFoodFromBasketRequest deleteFoodFromBasketRequest) async {
    var data = deleteFoodFromBasketRequest.toJson();
    var response = await Dio().post(endPoints.getDeleteFoodFromBasket(),data: FormData.fromMap(data));
  }

  @override
  Future<List<Food>> getAllFoods() async {
    var result = await Dio().post(endPoints.getAllFoods());
    var response = result.data.toString();
    return FoodResponse.fromJson(json.decode(response)).foodList;
  }

  @override
  Future<List<FoodBasket>> getAllFoodsInBasket(String username) async {
    var data = {"kullanici_adi":username};
    var response = await Dio().post(endPoints.getAllFoodsInBasket(),data: FormData.fromMap(data));
    try{
      return FoodBasketResponse.fromJson(json.decode(response.data.toString())).foodList;
    }on Exception catch(_){
      return <FoodBasket>[];
    }
  }

}