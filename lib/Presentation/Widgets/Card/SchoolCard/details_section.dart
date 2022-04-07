import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Detailstext extends StatelessWidget {
  final String? image;
  final String? title;
  final String? value;
  const Detailstext({Key? key, this.image, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 32,),
          const Divider(
            height: 1,
            endIndent: 20,
            indent: 20,
          ),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      SvgPicture.asset(image!),
                      SizedBox(width: 5,),
                      Text(title!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xFF1E1F20),)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(value!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1E1F20),))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
