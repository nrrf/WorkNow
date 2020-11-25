import 'package:flutter/material.dart';

import 'package:worknow/authentication/login_screen.dart';
import 'package:worknow/authentication/signup_screen.dart';

import 'package:worknow/home/cv_screen.dart';
import 'package:worknow/home/information_screen.dart';
import 'package:worknow/home/job_application.dart';
import 'package:worknow/home/search_work.dart';
import 'package:worknow/home/tab_screen.dart';
import 'package:worknow/home/works_screen.dart';

import 'package:worknow/init/splash_screen.dart'; 
import 'package:worknow/init/welcome_screen.dart';

class Router {
  static final Map<String, Widget Function(BuildContext)> routes = {
    //Authentication Screens
    LoginScreen.routeName: (ctx) => LoginScreen(),
    SignUpScreen.routeName: (ctx) => SignUpScreen(),
    // home Screens
    CvScreen.routeName: (ctx) => CvScreen(),
    InformationScreen.routeName: (ctx) => InformationScreen(),
    JobApplicationScreen.routeName: (ctx) => JobApplicationScreen(),
    SearchWorkScreen.routeName: (ctx) => SearchWorkScreen(),
    TabsScreen.routeName: (ctx) => TabsScreen(),
    WorksScreen.routeName: (ctx) => WorksScreen(),
    // Init Screens
    SplashScreen.routeName: (ctx) => SplashScreen(),
    WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
  };
}