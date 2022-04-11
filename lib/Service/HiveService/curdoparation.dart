import 'package:hive/hive.dart';

import '../../Data/Model/Categories/categories.dart';

class HiveOparation{

  addItem(Categories item) async {
    print(item);
    var box = await Hive.openBox<Categories>('categories');
    box.add(item);
    print(box);
  }



  List _inventoryList = <Categories>[];
  List get inventoryList => _inventoryList;
  boxOpe()async{
    var box = await Hive.openBox<Categories>('categories');
    print("open");
    _inventoryList = box.values.toList();

    for(Categories d in _inventoryList){
      print(d.name);
    }
    print(_inventoryList.length);
  }
}