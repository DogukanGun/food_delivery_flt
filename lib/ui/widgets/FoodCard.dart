import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
                width: 300,
                child: Text("TEst")
            ),
          ],
        )
      ),
    );
  }
}
