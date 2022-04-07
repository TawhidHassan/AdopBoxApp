
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AttendanceCard extends StatelessWidget {
  final String? image;
  final String? inTime;
  final String? outtime;
  final bool? late;
  final String? date;

  const AttendanceCard({Key? key, this.image, this.inTime, this.late, this.date, this.outtime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
      width: double.infinity,
      height: 105,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 35),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // image!=null?Image.network(image!): const CircleAvatar(
              //   radius: 35,
              //   backgroundImage: AssetImage('assets/images/user.png'),
              // ),
              const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              const SizedBox(width: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Check in',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ).tr(),
                      const SizedBox(height: 6),
                      Text(inTime!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.lightBlue,
                        ),
                      ).tr(),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Calendar.svg',
                          ),
                          SizedBox(width: 5),
                          Text(date!,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ).tr(),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Check out',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ).tr(),
                      const SizedBox(height: 6),
                      Text(outtime??"N/A",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.lightBlue,
                        ),
                      ).tr(),
                      const SizedBox(height: 12),
                      late! ?Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Time-red.svg',
                            color: Colors.red,
                          ),
                          SizedBox(width: 5),
                          Text('Late',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                            ),
                          ).tr(),
                        ],
                      ):Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/Time.svg',
                            color: Colors.green,
                          ),
                          SizedBox(width: 5),
                          Text('Present',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.green,
                            ),
                          ).tr(),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
