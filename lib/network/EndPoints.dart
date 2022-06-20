
class EndPoints{
  static String _url = "http://kasimadalan.pe.hu/yemekler/";

  static const String _getAllFoods ="tumYemekleriGetir.php";
  String getAllFoods(){
    return _url+_getAllFoods;
  }

  static const String _getAllFoodsInBasket ="sepettekiYemekleriGetir.php";
  String getAllFoodsInBasket(){
    return _url+_getAllFoodsInBasket;
  }

  static const String _addFoodToBasket ="sepeteYemekEkle.php";
  String getAddFoodToBasket(){
    return _url+_addFoodToBasket;
  }

  static const String _deleteFoodFromBasket ="sepettenYemekSil.php";
  String getDeleteFoodFromBasket(){
    return _url+_deleteFoodFromBasket;
  }

  static const String _getImageFromService ="resimler/";
  static String getImageFromService(String name){
    return _url+_getImageFromService+name;
  }

}