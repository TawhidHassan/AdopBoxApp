import 'package:adopbox/Data/Model/Categories/categoriesResponse.dart';
import 'package:flutter/material.dart';
import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../Widgets/Card/PatCard/pet_card.dart';

class CategoriWiseFeatcherPostSection extends StatefulWidget {
  const CategoriWiseFeatcherPostSection({Key? key}) : super(key: key);

  @override
  _CategoriWiseFeatcherPostSectionState createState() => _CategoriWiseFeatcherPostSectionState();
}

class _CategoriWiseFeatcherPostSectionState extends State<CategoriWiseFeatcherPostSection> {
  CategoriesResponse? data;
  String? token;
  //storage instance
  LocalDataGet _localDataGet = LocalDataGet();
  getToken() async {
    var tokenx = await _localDataGet.getData();
    setState(() {
      token = tokenx.get('token');
      // BlocProvider.of<CategoriesCubit>(context).getCategories(token);
      // Logger().d(token);
    });
  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getToken();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Dogs',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2,
                      color: Colors.black.withOpacity(0.6),
                    ),),
                  ),
                  Image.asset('assets/icons/dog.png'),
                ],
              ),
              InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Text('See All',style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: Colors.black.withOpacity(0.7),
                      letterSpacing: 2
                  ),),
                ),
              ),
            ],
          ),
          SizedBox(height: 8,),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                childAspectRatio: 5/3,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/details');
                    },
                    child: PetCompo());
              },
            ),
          ),

        ],
      ),
    );
  }
}
