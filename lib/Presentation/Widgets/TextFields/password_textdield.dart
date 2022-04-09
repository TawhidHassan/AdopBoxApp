
import 'package:flutter/material.dart';

import '../../../Constants/Colors/app_colors.dart';

class MaterialTextFieldPassword extends StatefulWidget {

  final String lable;
  final Icon prefIcon;
  MaterialTextFieldPassword({required this.lable,required this.controller,required this.prefIcon});
  TextEditingController controller = TextEditingController();

  @override
  State<MaterialTextFieldPassword> createState() => _MaterialTextFieldState();
}
class _MaterialTextFieldState extends State<MaterialTextFieldPassword> {
  bool _passwordVisible = true;

  @override
  void initState() {
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please fillup';
          }
          return null;
        },
        obscureText: _passwordVisible,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText:widget.lable,
          prefixIcon: widget.prefIcon,
          border: InputBorder.none,
          filled: true,
          fillColor: Color(0xFFFFDD99).withOpacity(0.4),
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color:Color(0xFF94A3B8),
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),

        ),
      ),
    );
  }
}
