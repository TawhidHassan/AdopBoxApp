import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../Constants/Colors/app_colors.dart';
import '../Constants/Strings/app_strings.dart';
import '../Service/LocalDataBase/localdata.dart';
import 'Pages/Home/home_page.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  String? name;
  String? email;

  //local storage
  LocalDataGet _localDataGet = new LocalDataGet();

  getToken() async {
    var userBox = await _localDataGet.getData();
    setState(() {
      name = userBox.get('name');
      email = userBox.get('email');
      // Logger().d(token)
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }
  List<Widget> _buildScreens() {
    return [
      HomePage(),
      HomePage(),
      HomePage(),
      HomePage(),
      HomePage(),
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: kPrimaryColorx,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.money_rubl_circle),
        title: ("Blog"),
        activeColorPrimary: kPrimaryColorx,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.add,color: Colors.white,),
        title: ("Add"),
        activeColorPrimary: kPrimaryColorx,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.location),
        title: ("Vet"),
        activeColorPrimary: kPrimaryColorx,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: kPrimaryColorx,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryColorx,
        child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Color(0xFFFFEBC2),
                elevation: 0,
                toolbarHeight: 52,
                leading: Container(
                  margin: EdgeInsets.only(top: 4, bottom: 4, left: 16,right: 6),
                  width: 200,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset("assets/images/logox.jpg"),
                    ),
                  ),
                ),
                actions: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: (){
                                  logOut(context);
                                },
                                child: Text(name ?? "",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFF807661),
                                    )),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                email ?? " ",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  height: 23,
                                  width: 23,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFFDD99),
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: SvgPicture.asset("assets/icons/msg.svg"),
                                ),Container(
                                  padding: EdgeInsets.all(4),
                                  height: 23,
                                  width: 23,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFFDD99),
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: SvgPicture.asset("assets/icons/heart.svg"),
                                ),Container(
                                  padding: EdgeInsets.all(4),
                                  height: 23,
                                  width: 23,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFF8484),
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: SvgPicture.asset("assets/icons/logout.svg"),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              body:PersistentTabView(
                context,
                controller: controller,
                screens: _buildScreens(),
                items: _navBarsItems(),
                confineInSafeArea: false,
                backgroundColor: Colors.white, // Default is Colors.white.
                handleAndroidBackButtonPress: true, // Default is true.
                resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
                stateManagement: true, // Default is true.
                hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
                decoration: NavBarDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  colorBehindNavBar: Color(0XFFFCFCFC),
                ),
                popAllScreensOnTapOfSelectedTab: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle.style16, // Choose the nav bar style with this property.
              ) ,

            )));
  }
}
void logOut(BuildContext context) async {
  var users = await Hive.openBox('users');
  users.clear();
  Navigator.pushReplacementNamed(context, LOGIN_PAGE);
}