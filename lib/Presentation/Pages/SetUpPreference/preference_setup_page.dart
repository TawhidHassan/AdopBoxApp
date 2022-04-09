import 'package:adopbox/Bloc/Categories/categories_cubit.dart';
import 'package:adopbox/Data/Model/Categories/categories.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:progress_state_button/progress_button.dart';

import 'package:dotted_line/dotted_line.dart';
import '../../../Service/LocalDataBase/localdata.dart';
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

  List<Categories> pickedCategory=[];

  String? token;
  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();
  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      token = tokenx.get('token');
      BlocProvider.of<CategoriesCubit>(context).getCategories(token);
      // Logger().d(token);
    });
  }

  void getCureentLocationName()async {
    var possition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //location name
    List<Placemark> placemarks = await placemarkFromCoordinates(possition.latitude, possition.longitude);
    print(placemarks[0].name.toString());
    setState(()  {
      addressController.text=placemarks[0].street.toString()
          +","+placemarks[0].locality.toString()+","+placemarks[0].postalCode.toString()
          +","+placemarks[0].subLocality.toString()
          +","+placemarks[0].subAdministrativeArea.toString();
    });
  }




  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getToken();
    getCureentLocationName();
  }
  @override
  Widget build(BuildContext context) {
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
                                      title: e.name,
                                      cardImg: e.photo,
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
                          BlocBuilder<CategoriesCubit, CategoriesState>(
                            builder: (context, state) {
                              if(state is !CategoriesLoaded){
                                return Center(child: CircularProgressIndicator(),);
                              }
                              final data=(state as CategoriesLoaded).categoriesResponse;
                              return GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 42.0,
                                    mainAxisSpacing: 2.0,
                                    childAspectRatio: 5/5
                                ),
                                itemCount: data!.category.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      setState(() {
                                        if(pickedCategory.length<3){
                                          pickedCategory.add(data.category[index]);
                                          // addressController.text="ssss";
                                        }
                                      });
                                    },
                                    child: PreferenceCard(
                                      color: RandomHexColor().colorRandom(),
                                      title: data.category[index].name,
                                      cardImg: data.category[index].photo,
                                    ),
                                  );
                                },
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
                            lable:"Your address",readOnly: true,controller:addressController, prefIcon: Icon(Icons.map,color: Colors.black.withOpacity(0.3),) ,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    addressController.text==""?Container(child: Text("getting your location please wait"),): pickedCategory.length<1?Container(): InkWell(
                        onTap: (){
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


