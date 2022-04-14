import 'package:adopbox/Data/Model/Categories/categoriesResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Bloc/Categories/categories_cubit.dart';
import '../../../../Constants/Strings/app_strings.dart';
import '../../../../Service/LocalDataBase/localdata.dart';
import '../../../../Utils/RandomColor/random_color.dart';
import '../../../Widgets/Card/PrefCard/prefer_card.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  CategoriesResponse? data;
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
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getToken();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Text('Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color:  Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: BlocBuilder<CategoriesCubit, CategoriesState>(
                  builder: (context, state) {
                    if(state is !CategoriesLoaded){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    data =(state as CategoriesLoaded).categoriesResponse;
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 42.0,
                          mainAxisSpacing: 2.0,
                          childAspectRatio: 5/5
                      ),
                      itemCount: int.parse((data!.category.length/2).ceil().toString(),),
                      itemBuilder: (context, index) {
                        return PreferenceCard(
                          color: RandomHexColor().colorRandom(),
                          title: data?.category[index].name,
                          cardImg: data?.category[index].photo,
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, ALL_CATEGORIES,arguments: {
                      "categories":data?.category
                    });
                  },
                  child: SvgPicture.asset("assets/images/seemore.svg",)),
            ],
          ),
        ),
      ],
    );
  }
}
