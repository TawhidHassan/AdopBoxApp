import 'package:adopbox/Presentation/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:progress_state_button/progress_button.dart';
import '../../../Bloc/Login/login_cubit.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../../Data/Model/Categories/categories.dart';
import '../../../Service/LoginService/save_user_data_local.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/Button/ProgressAnimtaionButton/progress_button.dart';
import '../../Widgets/TextFields/normal_textdield.dart';
import '../../Widgets/TextFields/password_textdield.dart';
import '../SetUpPreference/preference_setup_page.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emilController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  final _globalkey = GlobalKey<FormState>();

  late bool circule;
  late bool validate;

  ButtonState progressButtonState = ButtonState.idle;

  //local dataBase
  Box? users;
  LoginDataSave? loginDataSave;
  List<Categories> catList = [];
  boxOpe()async{
    var box = await Hive.openBox<Categories>('categories');
    print("open");
    catList = box.values.toList();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    boxOpe();
    users =Hive.box('users');
    loginDataSave=LoginDataSave();

  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener}
        if(state is LoginUser){
          setState(() {
            progressButtonState = ButtonState.idle;
          });

          final data=(state as LoginUser).login;

          if(data!.status=="fail"){
            // ignore: deprecated_member_use
            print(data.status);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("User id and password are mismatched").tr(),
              ),
            );
          }else{
            loginDataSave?.storeTokenUserdata(users,data.token, data.user!.id, data.user!.name, data.user!.email, data.user!.role);
            // Navigator.pushReplacement(context, PageTransition(PetSetupPage()));
            catList.isEmpty?
            Navigator.pushReplacementNamed(context, SETUP_PREFERANCE): Navigator.pushReplacement(context, PageTransition(MainScreen()));
          }
        }
      },
      child: Container(
        color: Colors.white,
        child: SafeArea(
          maintainBottomViewPadding: true,
          minimum: EdgeInsets.zero,
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/up.svg",),),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: SvgPicture.asset("assets/icons/down.svg"),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Form(
                          key: _globalkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 180,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top:65,
                                      left: 118,
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 82,
                                      bottom: 0,
                                      top: 4,
                                      child: Lottie.asset(
                                        "assets/lottie/cat_anim.json",
                                        height: 200,
                                      ),
                                    ),
                                  ],
                                )
                              ),
                              MaterialTextField(lable:tr("Email"),readOnly: false,prefIcon: Icon(Icons.mail,color: Colors.black.withOpacity(0.3),), controller:emilController ,),
                              const SizedBox(height: 12,),
                              MaterialTextFieldPassword(lable: tr("Password"),controller:passwordController ,prefIcon: Icon(Icons.mail,color: Colors.black.withOpacity(0.3)),),
                              const SizedBox(height: 12,),
                              Align(
                                alignment:Alignment.bottomRight,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, FORGET_PASSWORD_PAGE);
                                    },
                                    child:  Text("Forget Password?",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w300),).tr()
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 10),
                                child: ProgressAnimatedButton(text: tr("Login"),colors: Color(0xFFffbb33),progressButtonState: progressButtonState,tap: (){
                                  if (_globalkey.currentState!.validate()) {
                                    setState(() {
                                      validate = true;
                                      progressButtonState = ButtonState.loading;
                                      BlocProvider.of<LoginCubit>(context).logIn(emilController.text,passwordController.text);
                                    });
                                  }
                                },),
                              ),
                              const SizedBox(height: 12,),
                              InkWell(
                                  onTap: () {
                                    // logOut(context);
                                    Navigator.pushNamed(context, SIGNUP_PAGE);
                                  },
                                  child:RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'Dont’t have an account?  ', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.black.withOpacity(0.5))),
                                        TextSpan(text: 'Sign up', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Colors.black.withOpacity(0.5))),
                                      ],
                                    ),
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
