import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery_flt/res/color_resource.dart';
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

  var isFirstUsage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.background_color,
      appBar:  AppBar(
        title: const Text(
          "",
          style:  TextStyle(color: Colors.amber),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15.0),
              child: Container(
                decoration:  const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Ara",
                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    suffixIcon: Icon(Icons.search),
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(color: Colors.black),
                  onChanged: (text){
                  },
                ),
              ),
            ),
          ],
        ),
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
}
