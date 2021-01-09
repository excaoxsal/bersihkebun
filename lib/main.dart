    import 'package:flutter/material.dart';
import 'package:bersihkebun/pages/login/login_page.dart';
import 'package:bersihkebun/pages/login/register.dart';
import 'package:bersihkebun/screens/bottom_navigation/main_screen.dart';
import 'package:bersihkebun/pages/trycontact/home.dart';


void main() => runApp(MyApp());

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new MainScreen(),
  '/register': (BuildContext context) => new RegisterPage(),
  '/': (BuildContext context) => new LoginPage(),
  '/form': (BuildContext context) => new Home(),
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
