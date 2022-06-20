import 'package:flutter/material.dart';

class PopularFoodsCard extends StatefulWidget {
  const PopularFoodsCard({Key? key}) : super(key: key);

  @override
  State<PopularFoodsCard> createState() => _PopularFoodsCardState();
}

class _PopularFoodsCardState extends State<PopularFoodsCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset("asset/illustration1.png"),
          Text("TEst")
        ],
      ),
    );
  }
}
