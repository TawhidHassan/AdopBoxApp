
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String? title;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onTap;
  CustomButton({ this.title, this.color, this.textColor, this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:double.infinity,
        height:55,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text('$title',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ).tr(),
        ),
      ),
    );
  }
}
