import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../res/LocalstorageKeys.dart';
import '../../res/color_resource.dart';


class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final _formKey = GlobalKey<FormState>();

  Future<void> setLogin(BuildContext context, VoidCallback onSuccess) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(LocalStorageKeys.IS_LOGIN.name, true);
    onSuccess.call();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = (MediaQuery.of(context).size.height);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: screenHeight/5,
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Kullanıcı Adı',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen boş bırakmayın';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "Şifre",
                            suffixIcon: Icon(Icons.password)
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen boş bırakmayın';
                          }
                          return null;
                        },
                      ),
                    ],
                  )
              ),
            ),
            Row(
              children: [
                Expanded(
                  child:
                  ElevatedButton(
                    onPressed: (){
                      setLogin(context, () {
                        Navigator.pushNamed(context, "/Home");
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: ColorResource.button_primary_color,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150)),
                    ),
                    child:const  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text("Login"),
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
//swipe indicataar scrool indicattar texfiedl mask