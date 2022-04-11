import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryColorx,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFF1B3F73),
            elevation: 0,
            toolbarHeight: 110,
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
                      flex: 9,
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
                                  color: Colors.white,
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
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Expanded(
                    //   flex: 1,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       // Navigator.pushNamed(context, SURVEY_FIRST_PAGE);
                    //     },
                    //     child: SvgPicture.asset('assets/icons/sms.svg')
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          body: HomePage(),
        )));
  }
}
void logOut(BuildContext context) async {
  var users = await Hive.openBox('users');
  users.clear();
  Navigator.pushReplacementNamed(context, LOGIN_PAGE);
}