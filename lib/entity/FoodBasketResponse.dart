import 'package:flutter/material.dart';
import 'package:food_delivery_flt/entity/FoodBasket.dart';

import 'Food.dart';

class FoodBasketResponse{
  List<FoodBasket> foodList;
  int success;

  FoodBasketResponse({required this.foodList,required this.success});

  factory FoodBasketResponse.fromJson(Map<String, dynamic> json){
    var jsonArray = json["sepet_yemekler"] as List;
    List<FoodBasket> foodList_ = jsonArray.map((jsonArrayObject) => FoodBasket.fromJson(jsonArrayObject)).toList();
    return FoodBasketResponse(foodList:foodList_,success: json["success"] as int);
  }
}