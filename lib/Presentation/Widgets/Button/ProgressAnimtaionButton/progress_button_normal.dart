

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../../../Constants/Colors/app_colors.dart';

class ProgressAnimatedNormalButton extends StatefulWidget {

  final String text;
  final Function tap;
  final Color colors;
  final  ButtonState progressButtonState;
  const ProgressAnimatedNormalButton({ required this.text, required this.tap, required this.colors, required this.progressButtonState});

  @override
  _ProgressAnimatedNormalButtonState createState() => _ProgressAnimatedNormalButtonState();
}

class _ProgressAnimatedNormalButtonState extends State<ProgressAnimatedNormalButton> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Center(
          child: ProgressButton(
              radius: 12.0,
              height: 48.0,
              maxWidth: 600.0,
              minWidth: 500.0,
              onPressed: widget.tap,
              state: widget.progressButtonState, stateWidgets: {}, stateColors: {},)
      ),
    );
  }


}