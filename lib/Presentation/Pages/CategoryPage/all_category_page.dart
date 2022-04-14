import 'package:adopbox/Data/Model/Categories/categories.dart';
import 'package:flutter/material.dart';
import '../../../Utils/RandomColor/random_color.dart';
import '../../Widgets/Card/PrefCard/prefer_card.dart';

class AllCategoryPage extends StatefulWidget {
  final List<Categories>?categories;
  const AllCategoryPage({Key? key,  this.categories}) : super(key: key);

  @override
  _AllCategoryPageState createState() => _AllCategoryPageState();
}

class _AllCategoryPageState extends State<AllCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("All Categories",style: TextStyle(color: Colors.black),),
          leading: BackButton(color: Colors.black,),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text('Categories',
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
                      itemCount: widget.categories!.length,
                      itemBuilder: (context, index) {
                        return PreferenceCard(
                          color: RandomHexColor().colorRandom(),
                          title: widget.categories![index].name,
                          cardImg: widget.categories![index].photo,
                        );
                      },
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
