import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Categories{

  @JsonKey(name: "_id")
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? photo;



  Categories({
    this.id,
    this.name,
    this.photo,
  });

  factory Categories.fromJson(Map<String,dynamic>json)=>
      _$CategoriesFromJson(json);
  Map<String,dynamic>toJson()=>_$CategoriesToJson(this);

}