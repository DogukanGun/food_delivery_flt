
class DeleteFoodFromBasketRequest{
  int id;
  String username;

  DeleteFoodFromBasketRequest({required this.id,required this.username});

  factory DeleteFoodFromBasketRequest.fromJson(Map<String, dynamic> json) => DeleteFoodFromBasketRequest(
      id: json["sepet_yemek_id"] as int,
      username: json["kullanici_adi"] as String
  );

  Map<String, dynamic> toJson() => {
    "sepet_yemek_id": id,
    "kullanici_adi": username
  };
}