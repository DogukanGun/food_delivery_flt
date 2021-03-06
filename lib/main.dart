import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_flt/ui/food_detail/FoodDetailCubit.dart';
import 'package:food_delivery_flt/ui/home/Home.dart';
import 'package:food_delivery_flt/ui/home/HomeCubit.dart';
import 'package:food_delivery_flt/ui/onboard/Onboard.dart';
import 'package:food_delivery_flt/ui/order/OrderUIStep2Cubit.dart';
import 'package:food_delivery_flt/ui/search/SearchCubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_delivery_flt/ui/shopping_bag/ShoppingBagCubit.dart';
import 'package:food_delivery_flt/ui/splash/Splash.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
        BlocProvider(create: (context)=>OrderUIStep2Cubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: <String,WidgetBuilder>{
          '/Home':(BuildContext context) => const Home(),
          '/Splash':(BuildContext context) => const Splash(),
          '/Login':(BuildContext context) => const Onboard(),
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

