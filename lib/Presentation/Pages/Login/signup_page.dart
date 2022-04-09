import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:progress_state_button/progress_button.dart';
import '../../../Bloc/Login/login_cubit.dart';
import '../../../Constants/Strings/app_strings.dart';
import '../../../Service/LoginService/save_user_data_local.dart';
import '../../Screens/SplashScreen/splash_screen.dart';
import '../../Widgets/Button/ProgressAnimtaionButton/progress_button.dart';
import '../../Widgets/TextFields/normal_textdield.dart';
import '../../Widgets/TextFields/password_textdield.dart';
import '../SetUpPreference/preference_setup_page.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emilController= TextEditingController();
  TextEditingController nameController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController confirmPasswordController= TextEditingController();
  final _globalkey = GlobalKey<FormState>();

  late bool circule;
  late bool validate;

  ButtonState progressButtonState = ButtonState.idle;

  //local dataBase
  Box? users;
  LoginDataSave? loginDataSave;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          }else{
            loginDataSave?.storeTokenUserdata(users,data.token, data.user!.id, data.user!.name, data.user!.email, data.user!.role);
            Navigator.pushReplacement(context, PageTransition(PetSetupPage()));
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

                              MaterialTextField(lable:tr("Email"),readOnly: false,prefIcon: Icon(Icons.mail,color: Colors.black.withOpacity(0.3),), controller:emilController ,),
                              const SizedBox(height: 12,),
                              MaterialTextField(lable:tr("Name"),readOnly: false,prefIcon: Icon(Icons.mail,color: Colors.black.withOpacity(0.3),), controller:nameController ,),
                              const SizedBox(height: 12,),
                              MaterialTextFieldPassword(lable: tr("Password"),controller:passwordController ,prefIcon: Icon(Icons.mail,color: Colors.black.withOpacity(0.3)),),
                              const SizedBox(height: 12,),
                              MaterialTextFieldPassword(lable: tr("Confirm Password"),controller:confirmPasswordController ,prefIcon: Icon(Icons.mail,color: Colors.black.withOpacity(0.3)),),

                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 10),
                                child: ProgressAnimatedButton(text: tr("Login"),colors: Color(0xFFffbb33),progressButtonState: progressButtonState,tap: (){
                                  if (_globalkey.currentState!.validate()) {
                                    setState(() {
                                      validate = true;
                                      progressButtonState = ButtonState.loading;
                                      BlocProvider.of<LoginCubit>(context).SignUp(emilController.text,nameController.text,passwordController.text,confirmPasswordController.text);
                                    });
                                  }
                                },),
                              ),
                              const SizedBox(height: 12,),
                              InkWell(
                                  onTap: () {
                                    // logOut(context);
                                    Navigator.restorablePopAndPushNamed(context, LOGIN_PAGE);
                                  },
                                  child:RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'Have an account?  ', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.black.withOpacity(0.5))),
                                        TextSpan(text: 'Login', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Colors.black.withOpacity(0.5))),
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
void logOut(BuildContext context) async {
  var users = await Hive.openBox('users');
  users.clear();
  Navigator.pushReplacementNamed(context, LOGIN_PAGE);
}