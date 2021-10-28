import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstdart/config/constant.dart';
import 'package:firstdart/model/tct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  var data;

  @override
  void initState() {
    super.initState();
    print("HEllO");
    callAPI();
  }

  Future<void> callAPI() async{
    var url = Uri.parse("https://www.boredapi.com/api/activity");

    var response = await http.get(url);
    // print(response.statusCode);
    // print(response.body);

    setState(() {
      data = tctFromJson(response.body);
      // การเข้าถึงข้อมูลใน object
      print(data.activity);
      print(data.type);
      print(data.participants);
      print(data.price);
    });

    data = tctFromJson(response.body);
    // print(data.activity);
    // print(data.type);
  }

  Future<void> logout() async{
    await FirebaseAuth.instance.signOut();
    print("Logout Success");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFf2f2f2),
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 28,
                    color: pColor,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Video',
                  style: TextStyle(
                    fontSize: 20,
                    color: pColor,
                  ),
                ),
                leading: Icon(
                  Icons.video_collection_rounded,
                  color: pColor,
                ),
                onTap: () {
                  print('Menu Video');
                  Navigator.pushNamed(context, 'Video');
                },
              ),
              ListTile(
                title: Text(
                  'Images',
                  style: TextStyle(
                    fontSize: 20,
                    color: pColor,
                  ),
                ),
                leading: Icon(
                  Icons.image,
                  color: pColor,
                ),
                onTap: () {
                  print('Menu Images');
                  Navigator.pushNamed(context, 'Images');
                },
              ),
              ListTile(
                title: Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 20,
                    color: pColor,
                  ),
                ),
                leading: Icon(
                  Icons.location_on,
                  color: pColor,
                ),
                onTap: () {
                  print('Menu Location');
                  Navigator.pushNamed(context, 'Location');
                },
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 20,
                    color: pColor,
                  ),
                ),
                leading: Icon(
                  Icons.logout,
                  color: pColor,
                ),
                onTap: () {
                  logout();
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, 'Index', arguments: []);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.api_sharp),
              SizedBox(
                width: 10,
              ),
              Text('Dashboard'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              txtActivity(),
              txtType(),
              txtParticipants(),
              txtPrice(),
            ],
          ),
        ),
      ),
    );
  }


  Widget txtActivity(){
    return Container(
      color: const Color(0xff5ee400), // Yellow
      height: 120.0,
      alignment: Alignment.center,
      child: Text(data?.activity ?? "กำลังโหลด"),
    );
  }

  Widget txtType(){
    return Container(
      color: const Color(0xff968e10), // Yellow
      height: 120.0,
      alignment: Alignment.center,
      child: Text(data?.type ?? ""),
    );
  }

  Widget txtParticipants(){
    return Container(
      color: const Color(0xffeeee00), // Yellow
      height: 120.0,
      alignment: Alignment.center,
      child: Text('${data?.participants ?? ""}'),
    );
  }

  Widget txtPrice(){
    return Container(
      color: const Color(0xff968e10), // Yellow
      height: 120.0,
      alignment: Alignment.center,
      child: Text('${data?.price ?? ""}'),
    );
  }

}



