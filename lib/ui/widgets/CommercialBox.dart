import 'package:flutter/material.dart';
import 'package:food_delivery_flt/entity/Commercial.dart';

import '../../network/EndPoints.dart';
import '../../res/color_resource.dart';
import '../../res/dimen_resource.dart';

class CommercialBox extends StatelessWidget {

  Commercial commercial;

  CommercialBox({Key? key,required this.commercial}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: ColorResource.blue_color,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(child: Image.asset(commercial.fileName)),
                Text(commercial.text,style: TextStyle(
                    color: Colors.white,
                    fontSize: DimenResource.medium_text,
                    fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
      ),
    );
  }
}


