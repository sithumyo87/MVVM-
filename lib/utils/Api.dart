// import 'dart:convert';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:inter/utils/ApiStatus.dart';

class Api{
  static const BASE_URL = "https://jsonplaceholder.typicode.com";
  static var HEADER_URL = {"content-type":"application/json"};

  static Future<Object> get({url:String}) async {
    try{
      Uri uri = Uri.parse("$BASE_URL$url");
    var response  = await http.get(uri,headers:HEADER_URL);
    if(response.statusCode == 200){
      var resbody = jsonDecode(response.body);
      return Success(code: 200,response: resbody);
    }else{
       return Failure(code: 202, response: "Data Fetching Error");
    }
    }on SocketException{
      return Failure(code: 202, response: "Internet Error");
    } catch(e){
      print(e);
       return Failure(code: 202, response: "Unknown Error");
    }
  }
}