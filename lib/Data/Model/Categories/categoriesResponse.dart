import 'package:adopbox/Data/Model/Categories/categories.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categoriesResponse.g.dart';

@JsonSerializable()

class CategoriesResponse{



  String? status;
  List<Categories>category;


  CategoriesResponse(this.status, this.category);

  factory CategoriesResponse.fromJson(Map<String,dynamic>json)=>
      _$CategoriesResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$CategoriesResponseToJson(this);

}