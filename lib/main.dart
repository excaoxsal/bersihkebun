import 'package:bersihkebun/pages/form/bersihhalaman.dart';
import 'package:bersihkebun/pages/form/bersihjalan.dart';
import 'package:bersihkebun/pages/form/bersihkebun.dart';
import 'package:flutter/material.dart';
import 'package:bersihkebun/pages/login/login_page.dart';
import 'package:bersihkebun/pages/login/register.dart';
import 'package:bersihkebun/screens/bottom_navigation/main_screen.dart';
import 'package:bersihkebun/pages/form/bersihtaman.dart';
import 'package:bersihkebun/pages/form/historyorder.dart';
import 'package:bersihkebun/pages/form/historytype02.dart';



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
  '/history': (BuildContext context) => new Orders(),

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
