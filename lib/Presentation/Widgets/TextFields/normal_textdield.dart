
import 'package:flutter/material.dart';

import '../../../Constants/Colors/app_colors.dart';

class MaterialTextField extends StatelessWidget {
  final String lable;
  final Icon prefIcon;
  final bool readOnly;
   MaterialTextField({required this.lable,required this.controller,required this.readOnly,required this.prefIcon});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 48,
      color: Colors.grey.shade300.withOpacity(0.4),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fillup';
          }
          return null;
        },
        readOnly: readOnly,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText:lable,
          border: InputBorder.none,
          prefixIcon: prefIcon,
          filled: true,
          fillColor: Color(0xFFFFDD99).withOpacity(0.4),
        ),
      ),
    );
  }
}
