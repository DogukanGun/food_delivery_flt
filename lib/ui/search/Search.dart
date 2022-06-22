import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/network/EndPoints.dart';
import 'package:food_delivery_flt/res/dimen_resource.dart';
import 'package:food_delivery_flt/ui/food_detail/FoodDetail.dart';
import 'package:food_delivery_flt/ui/search/SearchCubit.dart';
import 'package:food_delivery_flt/ui/widgets/FoodListItem.dart';

import '../../entity/Food.dart';
import '../../res/color_resource.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  bool isSearchActive = false;

  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().getSearchList("");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<SearchCubit,List<Food>>(
        builder: (context,foods){
          return Column(
            children: [
              //search bar
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 15.0),
                child: Container(
                  decoration:  const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Ara",
                      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      suffixIcon: isSearchActive ? Icon(Icons.search) :  Icon(Icons.search),
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                    style: const TextStyle(color: Colors.black),
                    onChanged: (text){
                      if(text == ""){
                        isSearchActive = false;
                      }else{
                        isSearchActive = true;
                      }
                      context.read<SearchCubit>().getSearchList(text);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                  child: ListView.builder(
                      itemCount: foods.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        var food = foods[index];
                        return FoodListItem(
                          totalAmount: 1,
                          food: food,
                          delete:(){},
                          purchaseAvailable:true,
                          purchase: (totalAmount){
                            context.read<SearchCubit>().addFoodToBasket(food, "Dogukan", totalAmount);
                          },
                        );
                      }
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }


}
