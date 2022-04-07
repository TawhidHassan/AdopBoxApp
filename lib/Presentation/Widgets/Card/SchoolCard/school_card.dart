import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SchoolCard extends StatelessWidget {
  const SchoolCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8,top: 8),
      child:  Column(
        children: [
          Row(
            children: [
              Image.asset("assets/images/user.png",height: 56,width: 56,),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('School Name', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF1E1F20),)),
                  SizedBox(height: 6,),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/location.svg"),
                      SizedBox(width: 5,),
                      Text('Full Address goes here', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Color(0xFF1E1F20),)),
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 20,),
          Divider(
            height: 1,
          )
        ],
      )
    );
  }
}
