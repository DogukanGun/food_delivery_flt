
class AddFoodToBasketRequest{
  String food_name;
  String image_name;
  int price;
  int foodAmount;
  String username;

  AddFoodToBasketRequest({required this.food_name,
    required this.image_name,required this.price,required this.foodAmount
    ,required this.username});

  factory AddFoodToBasketRequest.fromJson(Map<String, dynamic> json) => AddFoodToBasketRequest(
      food_name: json["yemek_adi"] as String,
      image_name: json["yemek_resim_adi"] as String,
      price: json["yemek_fiyat"] as int,
      foodAmount: json["yemek_siparis_adet"] as int,
      username: json["kullanici_adi"] as String
  );

  Map<String, dynamic> toJson() => {
    "yemek_adi": food_name,
    "yemek_resim_adi": image_name,
    "yemek_fiyat": price,
    "yemek_siparis_adet": foodAmount,
    "kullanici_adi": username
  };
}