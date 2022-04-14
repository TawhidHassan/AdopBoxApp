

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/Categories/categories_cubit.dart';
import '../Bloc/Login/login_cubit.dart';
import '../Constants/Strings/app_strings.dart';
import '../Presentation/Pages/CategoryPage/all_category_page.dart';
import '../Presentation/Pages/IntroPage/intro_page.dart';
import '../Presentation/Pages/Login/login_page.dart';
import '../Presentation/Pages/Login/signup_page.dart';
import '../Presentation/Pages/SetUpPreference/preference_setup_page.dart';
import '../Presentation/Screens/SplashScreen/splash_screen.dart';



class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final Map? args = settings.arguments as Map?;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case LOGIN_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => LoginCubit(),
              child: LoginPage(),
            ));
      case SIGNUP_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => LoginCubit(),
              child: SignUpPage(),
            ));
      case SETUP_PREFERANCE:
        return MaterialPageRoute(
            builder: (BuildContext context) => BlocProvider(
              create: (context) => CategoriesCubit(),
              child: PetSetupPage(),
            ));
      case INTRO_PAGE:
        return MaterialPageRoute(
            builder: (BuildContext context) => IntroPage());
      case ALL_CATEGORIES:
        return MaterialPageRoute(
            builder: (BuildContext context) => AllCategoryPage(categories: args!["categories"],));

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => Container());
    }
  }
}