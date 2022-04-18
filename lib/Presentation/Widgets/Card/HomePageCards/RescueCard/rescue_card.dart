
import 'package:flutter/material.dart';

import '../../../../../Utils/RandomColor/random_color.dart';
class RescueCard extends StatelessWidget {
  final Image? cardImg;
  final String? category;
  final String? petName;
  final String? origin;
  final String? gender;
  final String? age;
  final String? details;
  const RescueCard({
    this.cardImg,
    this.category,
    this.petName,
    this.origin,
    this.gender,
    this.age,
    this.details,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      decoration: BoxDecoration(
        color: RandomHexColor().colorRandom(),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 61,
              height: 58,
              decoration: BoxDecoration(
                color: Color(0xFFFECFA3).withOpacity(0.9),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(child:cardImg),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('$category',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black.withOpacity(0.6),
                        ),),
                        Container(
                            margin: EdgeInsets.only(left: 4,right: 4),
                            width:1,height: 16,color: Colors.black.withOpacity(0.2)),
                        Text('$petName',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black.withOpacity(0.6),
                        ),),
                      ],
                    ),
                    //SizedBox(width: 116),
                    Container(
                      width: 29,
                      height: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color:Color(0xFFFFDD99),
                      ),
                      child: Center(
                        child: Text('Urgent',
                          style: TextStyle(
                            fontSize: 6,
                            fontWeight: FontWeight.w700,
                          ),),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Origin: ', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 6,color: Colors.black)),
                    Text('$origin',style: TextStyle(fontSize: 6,fontWeight: FontWeight.w300,color: Colors.black)),
                  ],
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    Text('$gender',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 6,color: Colors.black)),
                    Container(
                        margin: EdgeInsets.only(left: 2,right: 2),
                        width:1,height: 8,color: Colors.black.withOpacity(0.2)),
                    Row(
                      children: [
                        Text('Age: ', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 6,color: Colors.black)),
                        Text('$age',style: TextStyle(fontSize: 6,fontWeight: FontWeight.w300,color: Colors.black)),
                      ],
                    ),

                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Text('$details', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 6,color: Colors.black)),
                    Text('More...',style: TextStyle(fontSize: 6,fontWeight: FontWeight.w700,color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
