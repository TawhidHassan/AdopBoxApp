import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSliderComponent extends StatefulWidget {
  @override
  _HomeSliderComponentState createState() => _HomeSliderComponentState();
}

class _HomeSliderComponentState extends State<HomeSliderComponent> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(4,
            (index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade300,
              ),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Center(
                  child: Text(
                    "Page $index",
                    style: TextStyle(color: Colors.indigo),
                  )),
        ));
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 16),
        SizedBox(
          height: 150,
          child: PageView.builder(
            controller: controller,
            // itemCount: pages.length,
            itemBuilder: (_, index) {
              return pages[index % pages.length];
            },
          ),
        ),
        SizedBox(height: 15,),
        SmoothPageIndicator(
          controller: controller,
          count: pages.length,
          effect: WormEffect(
            dotHeight: 10,
            dotWidth: 10,
            type: WormType.thin,
            activeDotColor:  Color(0xFFFFDD99),
            dotColor: Color(0xFFFFEBC2)
            // strokeWidth: 5,
          ),
        ),
      ],
    );
  }
}
