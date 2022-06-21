import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/ui/food_detail/FoodDetailCubit.dart';
import 'package:food_delivery_flt/ui/home/Home.dart';
import 'package:food_delivery_flt/ui/home/HomeCubit.dart';
import 'package:food_delivery_flt/ui/search/SearchCubit.dart';
import 'package:food_delivery_flt/ui/shopping_bag/ShoppingBagCubit.dart';
import 'package:food_delivery_flt/ui/splash/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomeCubit()),
        BlocProvider(create: (context)=>SearchCubit()),
        BlocProvider(create: (context)=>ShoppingBagCubit()),
        BlocProvider(create: (context)=>FoodDetailCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: <String,WidgetBuilder>{
          '/Home':(BuildContext context) => const Home(),
          '/Splash':(BuildContext context) => const Splash(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}

