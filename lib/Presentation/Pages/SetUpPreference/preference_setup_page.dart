import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:progress_state_button/progress_button.dart';

import 'package:dotted_line/dotted_line.dart';
import '../../../Data/Model/Categories/categories.dart';
import '../../../Utils/RandomColor/random_color.dart';
import '../../Widgets/Button/custom_btn.dart';
import '../../Widgets/Card/PrefCard/prefer_card.dart';
import '../../Widgets/TextFields/normal_textdield.dart';
class PetSetupPage extends StatefulWidget {
  const PetSetupPage({Key? key}) : super(key: key);

  @override
  _PetSetupPageState createState() => _PetSetupPageState();
}

class _PetSetupPageState extends State<PetSetupPage> {
  TextEditingController addressController= TextEditingController();
  ButtonState progressButtonState = ButtonState.idle;

  List<String> pickedCategory=[];


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
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    boxOpe();
  }
  @override
  Widget build(BuildContext context) {

    // print(_inventoryList);
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/feather.svg'),
                          const SizedBox(width: 10),
                          const Text('Setup\nYour preference ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 7,),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Selected Categories',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color:  Colors.black.withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Row(
                                children:pickedCategory.map((e)  {
                                  return Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: PreferenceCard(
                                      color: RandomHexColor().colorRandom(),
                                      title: 'Dog',
                                      cardImg: SvgPicture.asset('assets/icons/dog.svg',color:Colors.white),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    DottedLine(),
                    SizedBox(height: 8,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Selecte Categories \nMaximum 3 Category',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color:  Colors.black.withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(height: 10),
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 42.0,
                                mainAxisSpacing: 2.0,
                                childAspectRatio: 5/5
                            ),
                            itemCount: 12,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    if(pickedCategory.length<3){
                                      pickedCategory.add("Dog");
                                    }
                                  });
                                },
                                child: PreferenceCard(
                                  color: RandomHexColor().colorRandom(),
                                  title: 'Dog',
                                  cardImg: SvgPicture.asset('assets/icons/dog.svg',color:Colors.white),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Text('Address',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color:  Colors.black.withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(height: 8),
                          MaterialTextField(
                            lable:"Your address",readOnly: false,controller:addressController, prefIcon: Icon(Icons.mail,color: Colors.black.withOpacity(0.3),) ,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    pickedCategory.length<1?Container(): InkWell(
                        onTap: (){
                          Categories categorieds=Categories(id: "sss",name: "dog",photo: "shshhs");
                          addItem(categorieds);
                          // print(Categories(id: "sss",name: "dog",photo: "shshhs"));
                          // Navigator.pushNamed(context, '/home');
                        },
                        child: CustomBtn()),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}


