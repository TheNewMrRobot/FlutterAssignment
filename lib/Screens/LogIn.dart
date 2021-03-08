import 'package:flutter/material.dart';
import 'package:product_list/Components/Buttons.dart';
import 'package:product_list/Components/IntialScreenText.dart';
import 'package:product_list/Screens/verifyOtp.dart';
import 'package:product_list/Services/OTP_Service.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String _phoneNumber;
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
                      child: InitialScreenText(color: Colors.white,text: "LogIn", size: 24.0,),
                    ),
                    SizedBox(
                        height: 18.0
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: InitialScreenText(color: Colors.white,text: "Please Enter your number to continue", size: 18.0,),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: InitialScreenText(text: "Phone Number",size: 18.0,color: Colors.grey,),
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
                              hintText: "Mobile Number",
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
                              _phoneNumber = number;
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
                      buttonName: "Send OTP",
                      textColor: Colors.white,
                      buttonColor: Colors.red,
                      onPressed: (){
                        sendOtp(_phoneNumber);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> VerifyOtp(phoneNumber: _phoneNumber,))
                        );
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
