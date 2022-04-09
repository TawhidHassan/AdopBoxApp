
import 'package:flutter/material.dart';
class CustomBtn extends StatefulWidget {
  const CustomBtn({Key? key}) : super(key: key);

  @override
  _CustomBtnState createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFFFDD99),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text('Get Start',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            )
        ),
      ),
    );
  }
}
