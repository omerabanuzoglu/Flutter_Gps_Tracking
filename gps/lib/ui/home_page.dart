import 'package:device_information/device_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:gsm/service/service.dart';
import 'package:gsm/widget/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String locationMessage = "";
  late String latitude;
  late String longitude;
  String ip = "";

  String platformVersion = 'Unknown', _modelName = "", _manufacturerName = "";

  Future<void> getCurrentLocation() async {
    late String platformVersion, modelName = '', manufacturer = '';
    try {
      platformVersion = await DeviceInformation.platformVersion;
      modelName = await DeviceInformation.deviceModel;
      manufacturer = await DeviceInformation.deviceManufacturer;
      var ipAddress = IpAddress(type: RequestType.json);
      dynamic data = ipAddress.getIpAddress().toString();
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      var lat = position.latitude;
      var long = position.longitude;
      latitude = "$lat";
      longitude = "$long";
      setState(() {
        locationMessage = "Enlem: $lat \nBoylam: $long";
        setState(() {
          platformVersion = "Running on :$platformVersion";
          _modelName = modelName;
          _manufacturerName = manufacturer;
        });
        postData(manufacturer, modelName, lat.toString(), long.toString());
        ip = data.toString();
      });
    } on PlatformException catch (e) {
      debugPrint(e.message);
    }
  }

  void googleMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw ("Harita yüklemedi!");
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, size: 40, color: Colors.white),
            bottomSpace,
            bottomSpace,
            Text(
              locationMessage,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            bottomSpace,
            bottomSpace,
            Text(
              "Model Name: $_modelName\nÜretici Adı: $_manufacturerName",
              style: const TextStyle(color: Colors.white),
            ),
            bottomSpace,
            ElevatedButton(
              onPressed: () {
                googleMap();
              },
              child: const Text(
                "Haritada Göster",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
