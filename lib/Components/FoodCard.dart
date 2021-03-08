import 'package:flutter/material.dart';
import 'package:product_list/Components/Buttons.dart';
import 'package:product_list/Components/IntialScreenText.dart';

class FoodCard extends StatelessWidget {

  final String status;
  final String netWeight;
  final String price;
  final String foodName;
  final String imageUrl;

  const FoodCard({Key key, this.status, this.netWeight, this.price, this.foodName,this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height *.80,
            width:MediaQuery.of(context).size.height *.20 ,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(imageUrl,fit: BoxFit.cover,),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text(status),
                ),
                InitialScreenText(text: foodName.replaceRange(10,foodName.length, "..."),size: 12.0,color: Colors.black, ),
                InitialScreenText(text: "Net Wt: $netWeight",size: 10.0,color: Colors.black,),
                Container(
                  width: MediaQuery.of(context).size.width * .45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("₹ ${price.toString()}"),
                      Buttons(onPressed: (){},buttonName: "Order",fontSize: 18.0,buttonColor: Colors.blue,textColor: Colors.white,borderColor: Colors.blue,)
                    ],
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
