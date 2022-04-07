import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../TabBarCard/language_tabbar.dart';

class LanguageCard extends StatefulWidget {
  final String? title;
  final Color? color;
  final SvgPicture? image;

  LanguageCard({this.title, this.color, this.image, Key? key})
      : super(key: key);

  @override
  State<LanguageCard> createState() => _LanguageCardState();
}

class _LanguageCardState extends State<LanguageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 9,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CircleAvatar(
                            backgroundColor: widget.color,
                            radius: 22,
                            child: Center(child: widget.image)),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 11,
                        child: Text(
                          widget.title!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ).tr(),
                      ),
                    ],
                  )),
              Expanded(flex: 4, child: LanguageTabbar())
            ],
          ),
          const Divider(
            indent: 40,
            thickness: 1.0,
          )
        ],
      ),
    );
  }
}
