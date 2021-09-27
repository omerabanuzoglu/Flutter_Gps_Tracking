import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewMap extends StatefulWidget {
  final String latitude;
  final String longitude;
  const ViewMap({Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  @override
  _ViewMapState createState() => _ViewMapState();
}

class _ViewMapState extends State<ViewMap> {
  Future<void> googleMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=${widget.latitude},${widget.longitude}";
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw ("Harita yüklemedi!");
    }
  }

  @override
  void initState() {
    super.initState();
    googleMap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
