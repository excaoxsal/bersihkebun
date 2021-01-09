import 'package:bersihkebun/pages/form/bersihhalaman.dart';
import 'package:bersihkebun/pages/form/bersihjalan.dart';
import 'package:bersihkebun/pages/form/bersihkebun.dart';
import 'package:bersihkebun/screens/bottom_navigation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bersihkebun/pages/home_page.dart';
import 'package:bersihkebun/pages/login/login_page.dart';
import 'package:bersihkebun/pages/login/register.dart';
import 'package:bersihkebun/screens/bottom_navigation/main_screen.dart';
import 'package:bersihkebun/screens/login_screen.dart';
import 'package:bersihkebun/screens/splash_screen.dart';
import 'package:bersihkebun/screens/verification_screen.dart';
import 'package:bersihkebun/pages/form/bersihtaman.dart';
import 'package:bersihkebun/pages/trycontact/home.dart';


void main() => runApp(MyApp());

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new MainScreen(),
  '/register': (BuildContext context) => new RegisterPage(),
  '/': (BuildContext context) => new LoginPage(),
  '/formtaman': (BuildContext context) => new BersihTaman(),
  '/formkebun': (BuildContext context) => new BersihKebun(),
  '/formjalan': (BuildContext context) => new BersihJalan(),
  '/formhalaman': (BuildContext context) => new BersihHalaman(),
  '/history': (BuildContext context) => new Home(),

};

class MyApp extends StatelessWidget {
 
 @override
 Widget build(BuildContext context){
   return new MaterialApp(
     title: 'Bersih Kebun',
     theme: new ThemeData(primarySwatch: Colors.teal),
     routes: routes,
   );
 }
}
