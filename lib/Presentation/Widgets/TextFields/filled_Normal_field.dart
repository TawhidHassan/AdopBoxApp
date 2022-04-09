
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
class FilledNormalField extends StatefulWidget {
  final String? title;
  final String? headertitle;
  final TextEditingController controller;
  FilledNormalField({
   this.title,
   this.headertitle,
    required this.controller,
   Key? key}) : super(key: key);

  @override
  _FilledNormalFieldState createState() => _FilledNormalFieldState();
}

class _FilledNormalFieldState extends State<FilledNormalField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.headertitle!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(0.8),
            ),
          ).tr(),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12)
            ),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please fillup';
                }
                return null;
              },
              controller: widget.controller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                hintText: widget.title!,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
