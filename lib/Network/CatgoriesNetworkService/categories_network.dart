
import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

import '../../Constants/Strings/app_strings.dart';

class CategoriesNetwork{
  var logger = Logger();


  Future getCategories(String? token) async{
    print("call");
    print(token);
    try{
      var response = await http.get(
        Uri.parse(BASE_URL + "category"),
        headers: {
          "Authorization":"Bearer "+token!,
          "Accept": "application/json"
        },
      );
      logger.d(response.body);
      return jsonDecode(response.body);
    }catch(e){
      print(e);
      return null;
    }
  }








}