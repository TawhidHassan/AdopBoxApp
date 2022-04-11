import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../../Data/CustomModel/intro_model.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/Button/custom_btn.dart';
import '../../main_screen.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int page = 0;
  LiquidController liquidController=LiquidController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  List<ItemData> data = [
    ItemData(Color(0XFFFFF5ED), "assets/images/intro_image_one.png", "Find Your Dream Pet Here", "It's Me"),
    ItemData( Color(0XFFF5ECFF), "assets/images/intro_image_one.png", "Take a", "Look At"),
    ItemData(Color(0XFFE9F8FF), "assets/images/intro_image_one.png", "Liked?", "Fork!"),
  ];

  pageChangeCallback(int lpage) {
    setState(() {
      print(lpage);
      page = lpage;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: double.infinity,
                color: data[index].color,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset(
                      data[index].image,
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          data[index].text1,

                        ),
                        Text(
                          data[index].text2,

                        ),

                      ],
                    ),
                    liquidController.currentPage==2?Container(
                      margin:EdgeInsets.only(left: 20,right: 20),
                      child:InkWell(
                          onTap:(){
                           introDone();
                          },
                          child: CustomBtn()),
                    ):Container()
                  ],
                ),
              );
            },
            positionSlideIcon: 0.0,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            onPageChangeCallback: pageChangeCallback,
            waveType: WaveType.liquidReveal,
            liquidController: liquidController,
            fullTransitionValue: 880,
            enableSideReveal: true,
            enableLoop: false,
            ignoreUserGestureWhileAnimating: true,
          ),
          liquidController.currentPage==2?Container(): Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FlatButton(
                onPressed: () {
                  liquidController.animateToPage(
                      page: data.length - 1, duration: 700);
                },
                child: Text("Skip to End"),
                color: Colors.white.withOpacity(0.01),
              ),
            ),
          ),
          liquidController.currentPage==2?Container(): Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FlatButton(
                onPressed: () {
                  liquidController.animateToPage(
                      page: liquidController.currentPage + 1, duration: 300);
                },
                child: Text("Next"),
                color: Colors.white.withOpacity(0.01),
              ),
            ),
          )
        ],
      ),
    );
  }

  void introDone()async {
    var  introBox = await Hive.openBox('intro');
    introBox.add("intro done");
    Navigator.pushReplacementNamed(context, LOGIN_PAGE);
  }
}
