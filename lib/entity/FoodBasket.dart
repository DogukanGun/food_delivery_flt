
import 'package:food_delivery_flt/entity/IFood.dart';

class FoodBasket extends IFood{
  String id;
  String food_name;
  String image_name;
  String price;
  String foodAmount;
  String username;

  FoodBasket({required this.id,required this.food_name,
    required this.image_name,required this.price,required this.foodAmount
    ,required this.username});

  factory FoodBasket.fromJson(Map<String, dynamic> json) => FoodBasket(
    id: json["sepet_yemek_id"] as String,
    food_name: json["yemek_adi"] as String,
    image_name: json["yemek_resim_adi"] as String,
    price: json["yemek_fiyat"] as String,
    foodAmount: json["yemek_siparis_adet"] as String,
    username: json["kullanici_adi"] as String
  );

  Map<String, dynamic> toJson() => {
    "sepet_yemek_id": id,
    "yemek_adi": food_name,
    "yemek_resim_adi": image_name,
    "yemek_fiyat": price,
    "yemek_siparis_adet": foodAmount,
    "kullanici_adi": username
  };
}