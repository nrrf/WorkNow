import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:worknow/colors/the_magenta.dart';
import 'package:worknow/colors/the_blue.dart';
import 'package:worknow/home/tab_screen.dart';
import 'package:worknow/home/works_screen.dart';
import 'package:worknow/home/search_work.dart';
import 'package:worknow/home/job_application.dart';
import 'package:worknow/init/splash_screen.dart';
import 'package:worknow/init/welcome_screen.dart';
import 'package:worknow/authentication/login_screen.dart';
import 'package:worknow/authentication/signup_screen.dart';
import 'package:worknow/services/authentication_provider.dart';
import 'package:worknow/services/auth.dart';
import 'package:worknow/routes.dart' as MyRouter;
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkNow',
      theme: ThemeData(
        primarySwatch: theMagenta,
        accentColor: theBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}
