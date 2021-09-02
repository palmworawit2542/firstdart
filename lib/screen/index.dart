import 'package:flutter/material.dart';

import '../config/constant.dart';

class Index extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
              Positioned(
                top: -50,
                left: -30,
                child: Image.asset(
                  "asset/image/orange_circle.png",
                  width: size.width * 0.3,
                ),
              ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                
                SizedBox(
                  height: 50,
                ),

                Image.asset(
                  "asset/image/logo_kmutnb.png",
                  width: size.width * 0.35,
                  //height: size.height * 0.35,
                ),
                
                SizedBox(
                  height: 20,
                ),

                Text(
                  "Welcome to KMUTNB",
                  style: TextStyle(
                    color: tColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                Image.asset(
                  "asset/image/img_login.png",
                  width: size.width * 0.9,
                  //height: size.height * 0.9,
                ),

                SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[600],
                    padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
                    shape: StadiumBorder(), 
                  ), 
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    print("LOGIN");
                    Navigator.pushNamed(context, 'Login');  //การนำทางไปหน้า Login
                  },
                ),

                SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[600],
                    padding: EdgeInsets.fromLTRB(115, 20, 115, 20),
                    shape: StadiumBorder(), 
                  ), 
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    print("SIGN UP");
                    Navigator.pushNamed(context, 'Register');
                  },
                ),

                // Image(
                //   image: NetworkImage(
                //     "https://images.unsplash.com/photo-1629941181242-7e3f06c9257d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                //   ),
                //   width: size.width * 0.9,
                //   height: size.height * 0.9,
                // ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}