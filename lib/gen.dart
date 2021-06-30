import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class GeneratePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  String qrData = "10%"; // already generated qr code when the page opens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Creer un QrCode'),
        actions: <Widget>[],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            QrImage(
              data: qrData,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Modifier le QrCode",
              style: TextStyle(fontSize: 25.0),
            ),
            TextField(
              controller: qrdataFeed,
              decoration: InputDecoration(
                hintText: "Input your link or data",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                //padding: EdgeInsets.all(15.0),
                onPressed: () async {
                  if (qrdataFeed.text.isEmpty) {
                    setState(() {
                      qrData = "";
                    });
                  } else {
                    setState(() {
                      qrData = qrdataFeed.text;
                    });
                  }
                },
                child: Text(
                  "Créer",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final qrdataFeed = TextEditingController();
}
