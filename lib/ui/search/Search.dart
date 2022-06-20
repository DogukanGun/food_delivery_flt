import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/network/EndPoints.dart';
import 'package:food_delivery_flt/res/dimen_resource.dart';
import 'package:food_delivery_flt/ui/search/SearchCubit.dart';

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
                        return SizedBox(
                          height: 150,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0,right: 15.0,top: 10.0,bottom: 10.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 50.0),
                                    child: Image.network(EndPoints.getImageFromService(food.image_name)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        food.food_name,
                                        style: TextStyle(
                                            fontSize: DimenResource.small_text,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        "${food.price} TL",
                                        style: TextStyle(
                                            fontSize: DimenResource.small_text,
                                            fontWeight: FontWeight.normal
                                        ),
                                      ),
                                      Spacer(),
                                      ElevatedButton(
                                        onPressed: (){
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: ColorResource.button_primary_color,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
                                        ),
                                        child:const  Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Icon(Icons.navigate_next_sharp,color: Colors.black,),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
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
