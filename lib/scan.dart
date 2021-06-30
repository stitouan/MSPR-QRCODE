import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qrscan/coupon.dart';
import 'global.dart' as globals;

class Coupon {
  final String coName;
  final String coCoupon;
  final String coStatus;

  Coupon(
      {required this.coName, required this.coCoupon, required this.coStatus});

  factory Coupon.fromJson(Map<String, dynamic> json) {
    return Coupon(
        coName: json['coName'],
        coCoupon: json['coCoupon'],
        coStatus: json['coStatus']);
  }
}

Future<Coupon> fetchCoupon(String qrcode) async {
  final response = await http.get(Uri.parse(
      'http://192.168.81.129/android/getcoupon.php?qrcode=' + qrcode));
  return Coupon.fromJson(jsonDecode(response.body));
}

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String _scanBarcode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan ton QrCode'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset("img/photo.png"),
            ElevatedButton(
              style: TextButton.styleFrom(
                primary: Colors.white, // foreground
              ),
              child: Text('Scan QrCode'),
              onPressed: () async {
                String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                    "#ff6666", "Cancel", false, ScanMode.DEFAULT);
                setState(() {
                  _scanBarcode = barcodeScanRes;
                  globals.qrcode = _scanBarcode;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Resultat()));
                });
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Resultat()));
              },
              child: Text('Afficher'),
            ),
          ],
        ),
      ),
    );
  }
}
