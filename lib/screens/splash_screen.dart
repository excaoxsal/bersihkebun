// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:bersihkebun/screens/login_screen.dart';
// import 'package:bersihkebun/widgets/grab_logo.dart';
//
// class SplashScreen extends StatefulWidget {
//   static const String id = "splash_screen";
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   Timer _timer;
//
//   removeScreen() {
//     return _timer = Timer(Duration(seconds: 2), () {
//       Navigator.of(context).pushReplacementNamed(LoginScreen.id);
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     removeScreen();
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).primaryColor,
//       body: Center(
//         child: GrabLogo(),
//       ),
//     );
//   }
// }
