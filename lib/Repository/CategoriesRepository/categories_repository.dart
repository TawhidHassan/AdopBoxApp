
import 'package:adopbox/Data/Model/Categories/categoriesResponse.dart';
import 'package:adopbox/Network/CatgoriesNetworkService/categories_network.dart';
import 'package:logger/logger.dart';

import '../../Data/Model/Login/Login.dart';
import '../../Network/LoginNetworkService/login_network.dart';

class CategoriesRepository{
  var logger = Logger();
  CategoriesNetwork categoriesNetwork=CategoriesNetwork();

  Future<CategoriesResponse> getCategories(String? token) async{
    final data=await categoriesNetwork.getCategories(token);
    // logger.d(AttendanceResponse.fromJson(attendance));
    return CategoriesResponse.fromJson(data);
  }
}