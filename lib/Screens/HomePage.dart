import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:product_list/Components/Buttons.dart';
import 'package:product_list/Components/FoodCard.dart';

class HomePage extends StatefulWidget {
  final String authToken;

  const HomePage({Key key, this.authToken}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List productsList;
  String url;
  String lat1 = "lat=17.4821&lng=78.3603" ;

  Future getProductList() async{
    url ='https://snehaselect-api.tkea.in/api/products?$lat1';
    String _authToken =widget.authToken;
    http.Response response =await http.get(Uri.parse(url),headers: {'Content-Type': 'application/json','Authorization': _authToken,});
    Map<String,dynamic> productsData =await json.decode(response.body);
    productsList = productsData['data']['products'];
    return productsList;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductList();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getProductList(),
          builder: (context,prod){
            if (prod.connectionState == ConnectionState.waiting) {
              return Center(
                child: Container(
                  child: Text("Loading..."),
                ),
              );
            }
            if(prod.hasData){
              return Column(
                children: [
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        lat1 = "lat=13.041241&lng=80.2521276";
                      });
                    },child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("Change Location"),
                    ],
                  ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .83,
                    child: ListView.builder(
                      itemCount: prod.data.length,
                      itemBuilder:(context,index){
                        if (prod.connectionState == ConnectionState.none &&
                            prod.hasData == null) {
                          return Container();
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FoodCard(status:"BEST SELLING",foodName: productsList[index]['name'],price: productsList[index]['sellingPrice'].toString(), netWeight: "1 Pc",imageUrl: productsList[0]["icon"]["file"]["previewUrl"],),
                        );
                      },
                    ),
                  ),
                ],
              );
            }else{
              return Center(
                child: Column(
                  children: [
                    MaterialButton(
                      onPressed: (){
                        setState(() {
                          lat1 = "lat=17.4821&lng=78.3603";
                        });
                      },child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text("Change Location"),
                      ],
                    ),),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Text("No Service for this location"),
                    ),
                  ],
                ),
              );
            }


          },
        )
      ),
    );
  }
}
