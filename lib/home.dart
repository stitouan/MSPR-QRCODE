import 'package:flutter/material.dart';
import 'package:qrscan/gen.dart';
import 'package:qrscan/scan.dart';

//import 'package:qr_code/scanner.dart';
//import 'package:qr_code/scan.dart';
//import 'package:qr_code/scanner.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GoStyle'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('img/skate.jpg'), fit: BoxFit.cover)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Nouveauté :",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 10)),
            Text(
              "Nous sommes heureux de vous annoncer le nouveau système promotionnel :",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 10)),
            Image.asset('img/promo.png'),
            Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
            Text(
              "Scannez votre QR CODE dès maintenant !",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 10, primary: Colors.blueAccent),
              child: Text(
                'Scan ton QrCode',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Scan()),
                );
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.grey, // foreground
              ),
              child: Text('GENERATION QR CODE'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GeneratePage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
