
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CustomIconButton extends StatelessWidget {
  final String? title;
  final Color? color;
  final Color? textColor;
  CustomIconButton({ this.title, this.color, this.textColor,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      height:55,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/camera.svg',color: Colors.black.withOpacity(0.8),),
            SizedBox(width: 10),
            Text('$title',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
