import 'package:flutter/material.dart';
import 'package:food_delivery_flt/res/LocalstorageKeys.dart';
import 'package:food_delivery_flt/res/color_resource.dart';
import 'package:food_delivery_flt/res/str_resource.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/dimen_resource.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var stateNumber = 1;
  Future<void> setFirstUsage(BuildContext context, VoidCallback onSuccess) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(LocalStorageKeys.IS_FIRST_USAGE.name, false);
    onSuccess.call();
  }
  void nextState(){
    if(stateNumber >2){
      setFirstUsage(context, () {
        Navigator.of(context).pushNamedAndRemoveUntil("/Home",(Route<dynamic> route)=>false);
      });
    }else{
      setState((){stateNumber+=1;});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("asset/illustration${stateNumber}.png"),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    textAlign: TextAlign.center,
                        (){
                      if(stateNumber == 1){
                        return StrResource.splash_title_1;
                      }else if(stateNumber == 2){
                        return StrResource.splash_title_2;
                      }else{
                        return StrResource.splash_title_3;
                      }
                    }(),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: DimenResource.medium_text),
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  (){
                    if(stateNumber == 1){
                      return StrResource.splash_text_1;
                    }else if(stateNumber == 2){
                      return StrResource.splash_text_2;
                    }else{
                      return StrResource.splash_text_3;
                    }
                  }(),
                  style: TextStyle(fontWeight: FontWeight.normal,fontSize: DimenResource.small_text),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: (){
                  nextState();
                },
                style: ElevatedButton.styleFrom(
                  primary: ColorResource.button_primary_color,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
                ),
                child:const  Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(Icons.navigate_next_sharp,color: Colors.black,),
                ),
            )
          ],
        ),
      ),
    );
  }
}
