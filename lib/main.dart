import 'package:flutter/material.dart';

import 'config/constant.dart';
import 'screen/index.dart';
import 'screen/home.dart';
import 'screen/login.dart';
import 'screen/register.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(),
      routes: {
        'Login' : (context) => Login(),
        'Register' : (context) => Register(),
      },
      theme: ThemeData(
        primaryColor: pColor,
        secondaryHeaderColor: sColor,
      ),
      //home: Home(),
      //routes: ,
    );
  }
}