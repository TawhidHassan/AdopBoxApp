import 'package:flutter/material.dart';
import '../../../Service/LocalDataBase/localdata.dart';
import 'Componenet/search_compo.dart';
import 'Componenet/slider_home.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  LocalDataGet _localDataGet= LocalDataGet();
  String? token;
  String? role;
  getToken()async{
    var tokenx=await _localDataGet.getData();
    setState(() {
      token=tokenx.get('token');
      role=tokenx.get('role');
      // Logger().d(token);
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
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFFFBFBFB),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            SearchComponent(),
            HomeSliderComponent()
          ],
        ),
      ),
    );
  }
}
