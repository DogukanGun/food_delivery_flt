import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery_flt/res/color_resource.dart';
import 'package:food_delivery_flt/res/dimen_resource.dart';
import 'package:food_delivery_flt/res/str_resource.dart';
import 'package:food_delivery_flt/ui/home/HomeLayout.dart';
import 'package:food_delivery_flt/ui/profile/Profile.dart';
import 'package:food_delivery_flt/ui/search/Search.dart';
import 'package:food_delivery_flt/ui/shopping_bag/ShoppingBag.dart';
import 'package:food_delivery_flt/ui/widgets/FoodCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/LocalstorageKeys.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> getFirstUsage(BuildContext context, VoidCallback onSuccess) async {
    final prefs = await SharedPreferences.getInstance();
    var value = prefs.getBool(LocalStorageKeys.IS_FIRST_USAGE.name);
    isFirstUsage = value ?? true;
    onSuccess.call();
  }

  var pageList = const [HomeLayout(),Search(),ShoppingBag(),Profile()];

  var isFirstUsage = false;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.background_color,
      appBar:  AppBar(
        centerTitle: true,
        title: const Text(
          "Hello Dogukan",
          style:  TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("asset/Icon-Home.png"),color: ColorResource.button_primary_color,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("asset/Icon-Search.png"),color: ColorResource.button_primary_color),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("asset/Icon-Bag.png"),color: ColorResource.button_primary_color),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("asset/Icon-Profile.png"),color: ColorResource.button_primary_color),
            label: '',
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    getFirstUsage(context, () {
      if(isFirstUsage) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            "/Splash", (Route<dynamic> route) => false);
      }
    });
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


