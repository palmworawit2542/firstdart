import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class PackageLocation extends StatefulWidget {
  const PackageLocation({ Key? key }) : super(key: key);

  @override
  _PackageLocationState createState() => _PackageLocationState();
}

class _PackageLocationState extends State<PackageLocation> {

  dynamic latitude = "";
  dynamic longitude = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    var location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    print(location);
    print(location.latitude);
    print(location.longitude);

    setState(() {
      latitude = '${location.latitude}';
      longitude = '${location.longitude}';
    });

    // การแปลง ละติจูด และ ลองจิจูด เป็นสถานที่จริง
    var address = await placemarkFromCoordinates(13.736717, 100.523186);
    print(address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Location'
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ละติจูด : ' + latitude, 
              style: TextStyle(fontSize: 28),
            ),
            Text(
              'ลองจิจูด : ' + longitude, 
              style: TextStyle(fontSize: 28),
            ),
          ],
        ),
      ),
    );
  }
}