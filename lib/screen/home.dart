import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KMUTNB'),
      ),
      body: Container(
        color: Colors.indigo,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 100,
              child: Text(
                "5555",style: 
                TextStyle(
                  fontSize: 48, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}