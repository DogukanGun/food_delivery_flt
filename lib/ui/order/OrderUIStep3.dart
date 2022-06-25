import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../res/color_resource.dart';


class OrderUIStep3 extends StatelessWidget {
  const OrderUIStep3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Lottie.asset('asset/order-packed.json'),
            Row(
              children: [
                Expanded(
                  child:
                  ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          "/Home", (Route<dynamic> route)=>false);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: ColorResource.button_primary_color,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
                    ),
                    child:const  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("Go Home"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
