import 'package:firebase_core/firebase_core.dart';
import 'package:firstdart/screen/dashboard.dart';
import 'package:firstdart/screen/firebaselogin.dart';
import 'package:firstdart/screen/firebaseregister.dart';
import 'package:firstdart/screen/packageimages.dart';
import 'package:firstdart/screen/packagelocation.dart';
import 'package:firstdart/screen/packagevideo.dart';
import 'package:flutter/material.dart';

import 'config/constant.dart';
import 'screen/index.dart';
import 'screen/home.dart';
import 'screen/login.dart';

//void main() => runApp(MyApp());
Future<void> main() async{
  // Open Connection go to Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //RunApp
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Index(),
      routes: {
        'Index' : (context) => Index(),
        'Login' : (context) => FirebaseLogin(),
        'Register' : (context) => FirebaseRegister(),
        'Dashboard' : (context) => Dashboard(),
        'Images' : (context) => PackageImages(),
        'Video' : (context) => PackageVideo(),
        'Location' : (context) => PackageLocation(),
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