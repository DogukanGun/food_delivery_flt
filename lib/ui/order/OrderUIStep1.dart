import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_flt/ui/order/OrderUIStep2.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../entity/FoodBasket.dart';
import '../widgets/FoodAppBar.dart';

class OrderUIStep1 extends StatefulWidget {
  List<FoodBasket> foods;

  OrderUIStep1({Key? key,required this.foods}) : super(key: key);

  @override
  State<OrderUIStep1> createState() => _OrderUIStep1State();
}

class _OrderUIStep1State extends State<OrderUIStep1> {

  TextEditingController addressEditingController = TextEditingController();
  TextEditingController telephoneEditingController = TextEditingController();
  int currentStep = 0;
  int _stepCount = 2;
  final maskCpf = MaskTextInputFormatter(mask: "###-###-##-##", filter: {"#": RegExp(r'[0-9]')});


  StepState isState2Complete(){
    if(currentStep == 1){
      return StepState.editing;
    }else{
      if(telephoneEditingController.text.length != 11){
        return StepState.error;
      }
      return StepState.complete;
    }
  }

  StepState isState1Complete(){
    if(currentStep == 0){
      return StepState.editing;
    }else{
      return StepState.complete;
    }
  }

  void _stepContinue(){
    if(currentStep+1<_stepCount){
      setState((){currentStep += 1;});
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderUIStep2(foods: widget.foods,)));
    }
  }

  void _stepBack(){
    if(currentStep>0){
      setState((){currentStep -= 1;});
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height);
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(screenHeight/10),
          child: FoodAppBar(title: "Dogukan",saveButton: false,)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stepper(
              steps:<Step>[
                  Step(
                    title: const Text("Adress"),
                    isActive: currentStep == 0,
                    state: isState1Complete(),
                    content: TextField(
                      controller: addressEditingController,
                      decoration: const InputDecoration(hintText: 'address'),
                    )
                  ),
                  Step(
                    title: const Text("Phone Number"),
                    isActive: currentStep == 1,
                    state: isState2Complete(),
                    content: TextField(
                      keyboardType: TextInputType.number,
                      controller: telephoneEditingController,
                      maxLength: 14,
                      inputFormatters:[
                        maskCpf
                      ],
                      decoration: const InputDecoration(icon: Icon(Icons.phone_iphone),hintText: "phone number"),
                    )
                  )
                ],
              currentStep: currentStep,
              onStepContinue: _stepContinue,
              onStepCancel: _stepBack
          ),
        ],
      ),
    );
  }
}