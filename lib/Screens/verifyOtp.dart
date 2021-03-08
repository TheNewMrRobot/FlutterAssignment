import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:product_list/Components/Buttons.dart';
import 'package:product_list/Components/IntialScreenText.dart';
import 'package:product_list/Screens/HomePage.dart';
import 'package:product_list/Services/Device_Info.dart';
import 'package:product_list/Services/OTP_Service.dart';

class VerifyOtp extends StatefulWidget {
  final String phoneNumber;

  const VerifyOtp({Key key, this.phoneNumber}) : super(key: key);
  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String _otp;
  Map<String,dynamic> deviceData;
  InternetAddress ip;

  getDeviceInfo()async{

    ip = await selfIP;
    deviceData =   await initPlatformState();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeviceInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: IconButton(
                          icon:Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: (){Navigator.pop(context);}),
                    ),
                    SizedBox(
                        height: 18.0
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: InitialScreenText(color: Colors.white,text: "OTP Sent", size: 24.0,),
                    ),
                    SizedBox(
                        height: 18.0
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: InitialScreenText(color: Colors.white,text: "Please Enter your Otp to continue", size: 18.0,),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: InitialScreenText(text: "OTP",size: 18.0,color: Colors.grey,),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "OTP",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red,
                                      width: 1.5
                                  )
                              )
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (number){
                            setState(() {
                              _otp = number;
                            });
                          },
                        ),
                        width: MediaQuery.of(context).size.width * .75,
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: Container(
                    width: MediaQuery.of(context).size.width* .60,
                    child: Buttons(
                      buttonName: "Verify OTP",
                      textColor: Colors.white,
                      buttonColor: Colors.red,
                      onPressed: ()async{
                        Response response = await getAuthToken(_otp, widget.phoneNumber, deviceData,ip.toString());
                         Map<String,dynamic> logInData = json.decode(response.body);
                         bool logIn = logInData['success'];
                         String authToken = logInData['data']['authToken'];
                         if(logIn){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context)=> HomePage(authToken:authToken,))
                           );
                         }else{
                           SnackBar(content: Text("Please Enter correct OTP"),duration:Duration(seconds: 2),);
                         }
                      },fontSize: 18.0,
                      buttonHeight: 50.0,
                      borderColor: Colors.red,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
