
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Widgets/TextFields/search_textdield.dart';

class SearchComponent extends StatelessWidget {
  TextEditingController searchController= TextEditingController();
   SearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: Container(
                width: MediaQuery.of(context).size.width*0.82,
                height: 37,
                child: SearchTextField(readOnly: false, lable: 'Search', controller: searchController, prefIcon: Icon(Icons.search_sharp),)),
          ),
          SizedBox(width: 16,),
          Expanded(
            flex: 1,
              child: Container(
                height: 34,
                  width: 34,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xFFFFDD99)),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(child: SvgPicture.asset('assets/icons/setting.svg',))
              ),
          )
        ],
      ),
    );
  }
}
