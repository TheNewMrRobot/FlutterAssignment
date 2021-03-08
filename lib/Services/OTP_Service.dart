import 'dart:convert';

import 'package:http/http.dart' as http;


Future<http.Response> sendOtp(String phoneNumber)async{
  var url =  'https://snehaselect-api.tkea.in/api/users/send-otp';
  var body =json.encode({
    'phoneNumber':phoneNumber,
    'countryCode':'91'
  });
  var response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: body);
  return response;
}


Future<http.Response> getAuthToken(String otp,String phoneNumber,Map<String,dynamic> deviceData,String ip) async{
  var url =  'https://snehaselect-api.tkea.in/api/users/sessions';
  var body = json.encode(
      {
        "phoneNumber": phoneNumber,
        "countryCode": "91",
        "otp": otp,
        "deviceInfo": {
          "deviceId": "123",
          "osVersion": "12.0",
          "appVersion": "1.0.0",
          "platform": "ANDROID",
          "ip": "127.0.0.1"
        }
      }
  );

  http.Response response = await http.post(Uri.parse(url),body: body,headers: {"Content-Type": "application/json"},);
  return response;
}