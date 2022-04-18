import 'package:flutter/material.dart';

import '../../../../Utils/RandomColor/random_color.dart';
class PetCompo extends StatelessWidget {
  const PetCompo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12,bottom: 10),
      width: MediaQuery.of(context).size.width*0.5,
      height: 106,
      decoration: BoxDecoration(
        color:  RandomHexColor().colorRandom(),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0,horizontal: 9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13.0,top: 8),
                  child: const Text(
                    "Kitty Sadia",
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    print('clicked');
                  },
                  child: Container(
                    height: 10,
                    width: 10,
                    margin: EdgeInsets.only(right: 2),
                    decoration: BoxDecoration(
                      color: Color(0xffFFDD99),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.all(2.0),
                      child: Center(
                        child: Icon(
                          Icons.favorite,
                          color: Color(0xFFDB827E),
                          size: 6,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.only(left:29.0,top: 12),
                    color: Color(0),
                    child: Image.asset('assets/icons/dog.png',height: 42,)),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/location.png',color: Colors.black,),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Dhaka, Dhanmondi",
                            style: TextStyle(
                              fontSize: 6,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: 'Origin: ', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 6,color: Colors.black)),
                            TextSpan(text: 'Deshi bride',style: TextStyle(fontSize: 6,fontWeight: FontWeight.w300,color: Colors.black)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Color(0xFF3969F6).withOpacity(0.2),
                            ),
                            child: const Center(
                              child: Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: 3,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF3969F6),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 3.0),
                            width: 0.78,
                            height: 10,
                            color: Colors.black.withOpacity(0.2),
                          ),
                          const Text(
                            "Age:",
                            style: TextStyle(
                              fontSize: 6,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            width: 16,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Color(0xFFF8C055).withOpacity(0.2),
                            ),
                            child: Center(
                              child: Text('8 month',style: TextStyle(fontSize: 3,fontWeight: FontWeight.w300),),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 29,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Color(0xffFFDD99),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Center(
                            child: Text(
                              "Adopt",
                              style: TextStyle(
                                fontSize: 6,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
