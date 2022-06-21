
import 'package:food_delivery_flt/entity/IFood.dart';

class Food extends IFood{
  String id;
  String food_name;
  String image_name;
  String price;

  Food({required this.id,required this.food_name,required this.image_name,required this.price});

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json["yemek_id"] as String,
    food_name: json["yemek_adi"] as String,
    image_name: json["yemek_resim_adi"] as String,
    price: json["yemek_fiyat"] as String,
  );

  Map<String, dynamic> toJson() => {
    "yemek_id": id,
    "yemek_adi": food_name,
    "yemek_resim_adi": image_name,
    "yemek_fiyat": price,
  };
}