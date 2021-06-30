import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/scan.dart';
import 'global.dart' as globals;

class Resultat extends StatefulWidget {
  const Resultat({Key? key}) : super(key: key);

  @override
  _ResultatState createState() => _ResultatState();
}

class _ResultatState extends State<Resultat> {
  var futureCoupon = fetchCoupon(globals.qrcode);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Coupon'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          decoration: new BoxDecoration(color: Colors.white),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20.0),
          child: FutureBuilder<Coupon>(
            future: futureCoupon,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.coStatus == 'ERROR') {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "Félicitations !",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 35),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 0)),
                      Text(
                          "Vous disposez d'une " +
                              snapshot.data!.coName +
                              "% sur votre prochaine commande.",
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.center),
                      Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 40)),
                      Image.asset(
                        'img/reduc.png',
                        height: 200,
                        width: 200,
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 10)),
                      Text(
                        "Afin de disposez de votre offre il vous suffit d'entrée le code suivant à votre prochaine commande :",
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 35, 0, 10)),
                      Text(
                        snapshot.data!.coCoupon,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  );
                }
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ));
  }
}
