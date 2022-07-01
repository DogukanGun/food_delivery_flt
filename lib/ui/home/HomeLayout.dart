import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/entity/Commercial.dart';
import 'package:food_delivery_flt/entity/Food.dart';
import 'package:food_delivery_flt/ui/home/HomeCubit.dart';
import 'package:food_delivery_flt/ui/search/Search.dart';
import 'package:food_delivery_flt/ui/widgets/CommercialBox.dart';

import '../../res/dimen_resource.dart';
import '../../res/str_resource.dart';
import '../widgets/FoodCard.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List<String> commerList = ["Büyük indirim","Küçük indirim","Orta indirim"];

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getAllFoods();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<HomeCubit,List<Food>>(
        builder: (context,foods){
          if(foods.isNotEmpty){
            return Column(
              children: [
                //FoodCard List
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    height: 250,
                    child: GridView.builder(
                        scrollDirection:Axis.horizontal,
                        itemCount: 3,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1 / 1
                        ),
                        itemBuilder: (context,index){
                          if(index == 0){
                            return Padding(
                              padding:const EdgeInsets.only(left: 15.0),
                              child: CommercialBox(commercial: Commercial(fileName: "asset/commer${index+1}.png", text: commerList[index]),),
                            );
                          }
                          return CommercialBox(commercial: Commercial(fileName: "asset/commer${index+1}.png", text: commerList[index]),);
                        }
                    ),
                  ),
                ),
                //Title
                Padding(
                  padding: const EdgeInsets.only(left:15.0,top: 15.0,right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[
                            Text(
                              StrResource.homepage_food_title,
                              style: TextStyle(
                                  fontSize: DimenResource.medium_text,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ]
                      ),
                      Text(
                        StrResource.homepage_food_text,
                        style: TextStyle(
                            fontSize: DimenResource.small_text,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ],
                  ),
                ),
                //PopularFoodsCard List
                Padding(
                  padding: const EdgeInsets.only(top: 15.0,bottom: 15.0),
                  child: SizedBox(
                    height: 200,
                    child: GridView.builder(
                        scrollDirection:Axis.horizontal,
                        itemCount: 5,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1 / 1
                        ),
                        itemBuilder: (context,index){
                          if(index == 0){
                            return Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: FoodCard(food: foods[index],height: 100,width: 300,),
                            );
                          }
                          return FoodCard(food: foods[index],height: 100,width: 300,);
                        }
                    ),
                  ),
                )
              ],
            );
          }
          return Text("Loading....");
        }
      ),
    );
  }
}
