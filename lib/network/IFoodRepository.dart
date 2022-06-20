
import '../entity/Food.dart';

abstract class IFoodRepository{
  List<Food> getAllFoods();
  void addFoodToBasket();
  List<Food> getAllFoodsInBasket();
  void deleteFoodFromBasket();
  String getImageFromService();
}