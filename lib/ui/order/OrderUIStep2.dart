import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:food_delivery_flt/ui/order/OrderUIStep2Cubit.dart';

import '../../entity/FoodBasket.dart';
import '../../res/color_resource.dart';
import '../widgets/FoodAppBar.dart';

class OrderUIStep2 extends StatefulWidget {
  List<FoodBasket> foods;

  OrderUIStep2({Key? key,required this.foods}) : super(key: key);

  @override
  State<OrderUIStep2> createState() => _OrderUIStep2State();
}

class _OrderUIStep2State extends State<OrderUIStep2> {
  @override
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void deleteFoods(){
    for(FoodBasket foodBasket in widget.foods){
      context.read<OrderUIStep2Cubit>().deleteFoodsFromBasket(foodBasket);
    }

  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height);

    return  Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size.fromHeight(screenHeight/10),
          child: FoodAppBar(title: "Dogukan")
      ),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              CreditCardWidget(
                cardBgColor: Colors.red,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: false,
                isHolderNameVisible: true,
                obscureCardCvv: true,
                onCreditCardWidgetChange: (CreditCardBrand ) {  },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(
                        formKey: formKey,
                        onCreditCardModelChange: onCreditCardModelChange,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumberDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                        ),
                        expiryDateDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Card Holder Name',
                        ),
                        cardHolderName: cardHolderName,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        expiryDate: expiryDate,
                        themeColor: Colors.black,
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            child:
                            ElevatedButton(
                              onPressed: (){
                                deleteFoods();
                                Navigator.of(context).popUntil((route) => route.isFirst);

                              },
                              style: ElevatedButton.styleFrom(
                                primary: ColorResource.button_primary_color,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
                              ),
                              child:const  Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text("Let's Pay"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
