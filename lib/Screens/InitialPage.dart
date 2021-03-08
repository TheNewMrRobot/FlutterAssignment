import 'package:flutter/material.dart';
import 'package:product_list/Components/Buttons.dart';
import 'package:product_list/Components/IntialScreenText.dart';
import 'package:product_list/Screens/LogIn.dart';


class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                    'Assets/delivery.png',
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(12.0, 50.0, 0, 10.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InitialScreenText(text:  "Get Deliveries",size: 20,color: Colors.black,),
                    SizedBox(height: 15.0,),
                    InitialScreenText(text:  "at your door step.",size: 20,color: Colors.black,),
                    SizedBox(height: 15.0,),
                    InitialScreenText(text: "In love with meat register now & get offers." ,size: 12,color: Colors.grey,),
                    SizedBox(height: 15.0,),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child:Row(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Buttons(
                          onPressed: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder:(context)=> LogIn())
                            );
                          },
                          buttonName: "Log In",
                          buttonColor: Colors.white,
                          buttonHeight: 50.0,
                          fontSize: 18.0,
                          textColor: Colors.blue,
                          borderColor: Colors.blue,
                        ),
                      ),
                    )),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Buttons(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder:(context)=> LogIn())
                            );
                          },
                          buttonName: "Register",
                          buttonColor: Colors.blue,
                          buttonHeight: 50.0,
                          fontSize: 18.0,
                          textColor: Colors.white,
                          borderColor: Colors.blue,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
