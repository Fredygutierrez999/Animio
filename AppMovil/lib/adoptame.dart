import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Adoptame extends StatefulWidget {
  @override
  _AdoptameState createState() => _AdoptameState();
}

class _AdoptameState extends State<Adoptame> {
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ANIMIO"),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Center(
                        child: Container(
                            width: 80,
                            /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                            child: Image.asset('asset/images/logo_dogs.png')),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Card(
                            color: Colors.blueGrey.shade300,
                            child: Text.rich(TextSpan(children: <InlineSpan>[
                              TextSpan(
                                text: "Adóptame!!!",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ]))),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // height: 200,
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom: 20,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.30,
                                      child: Container(
                                          alignment: Alignment.bottomCenter,
                                          child: Image.asset(
                                              'asset/images/schnauzer.jpeg')),
                                    )
                                  ]),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        'Tiryon',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.mars,
                                        size: 20,
                                        color: Colors.indigoAccent.shade700,
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Schnauzer Miniatura',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '3 Año(s)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        size: 16,
                                        color: Colors.green.shade600,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Ibagué - Distance: 1.3 Km',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.10,
                                            decoration: BoxDecoration(
                                                color: Colors.indigo.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: TextButton(
                                              onPressed: () {
                                                //Haga algo
                                              },
                                              child: Text(
                                                'Adoptar',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.30,
                                      child: Container(
                                          alignment: Alignment.bottomCenter,
                                          child: Image.asset(
                                              'asset/images/shih_tzu.jpeg')),
                                    )
                                  ]),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Text(
                                        'Candy',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.venus,
                                        size: 20,
                                        color: Colors.purple.shade700,
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Shih tzu',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '1 Año(s)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        size: 16,
                                        color: Colors.green.shade600,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Distance: 0.8 Km',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.10,
                                            decoration: BoxDecoration(
                                                color: Colors.indigo.shade200,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: TextButton(
                                              onPressed: () {
                                                //Haga algo
                                              },
                                              child: Text(
                                                'Adoptar',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        //boxShadow: customShadow,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
