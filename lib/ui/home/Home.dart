import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery_flt/res/color_resource.dart';
import 'package:food_delivery_flt/ui/home/HomeLayout.dart';
import 'package:food_delivery_flt/ui/profile/Profile.dart';
import 'package:food_delivery_flt/ui/search/Search.dart';
import 'package:food_delivery_flt/ui/shopping_bag/ShoppingBag.dart';
import 'package:food_delivery_flt/ui/widgets/FoodAppBar.dart';
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

  Future<void> getLoginState(BuildContext context, VoidCallback onSuccess) async {
    final prefs = await SharedPreferences.getInstance();
    var value = prefs.getBool(LocalStorageKeys.IS_LOGIN.name);
    isLogin = value ?? true;
    onSuccess.call();
  }

  var pageList =  [const HomeLayout(),const Search(),ShoppingBag(),const Profile()];

  var isFirstUsage = false;
  var isLogin = false;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height);
    double screenWidth = (MediaQuery.of(context).size.width);

    return Scaffold(
      backgroundColor: ColorResource.background_color,
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(screenHeight/10),
          child: FoodAppBar(title: "Dogukan",saveButton: pageList[_selectedIndex].runtimeType == ShoppingBag,voidCallback: (){
            (pageList[2] as ShoppingBag).state.changeProducts();
          })
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
    getLoginState(context, () {
      if(!isLogin){
        Navigator.of(context).pushNamedAndRemoveUntil(
            "/Home",(Route<dynamic> route)=>false);
      }
    });
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}


