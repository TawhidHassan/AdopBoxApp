
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class PreferenceCard extends StatelessWidget {
  final String? title;
  final String? cardImg;
  final Color? color;
  const PreferenceCard({this.title,this.cardImg,Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color:  color,
            //border: Border.all(color:Color(0xFFDADADA))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cardImg =="N/A" ? Image.asset('assets/icons/dog.png',height: 30,):Expanded(child: Image.network(cardImg!)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(title!,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
