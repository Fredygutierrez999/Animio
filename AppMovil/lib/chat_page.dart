import 'package:flutter/material.dart';

class Chatpage extends StatefulWidget {
  @override
  _ChatpageState createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
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
                            width: 60,
                            /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                            child: Image.asset('asset/images/logo_dogs.png')),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Card(
                            color: Colors.blueGrey.shade300,
                            child: Text.rich(TextSpan(children: <InlineSpan>[
                              TextSpan(
                                text: "Chatea con Nosotros",
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
                    SizedBox(
                      child: Card(
                          elevation: 2,
                          child: Text.rich(TextSpan(children: <InlineSpan>[
                            TextSpan(
                              text: "Nov 22, 20:22",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ]))),
                    ),
                    Row(children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          //height: 100,
                          child: Card(
                              elevation: 2,
                              color: Colors.grey.shade300,
                              child: Text.rich(TextSpan(children: <InlineSpan>[
                                TextSpan(
                                  text:
                                      "Somos ANIMIO, adiestradores de perros. Agradecemos por comunicarte con nosotros. ¿En qué podemos ayudarte?",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      //"${comment.data()['comment']}"
                                      text: '\n Noviembre 22 de 2021, 20:22',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                )
                              ]))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.10,
                          //foregroundImage: NetworkImage("enterImageUrl"),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          //height: 100,
                          child: Card(
                              color: Colors.teal.shade700,
                              child: Text.rich(TextSpan(children: <InlineSpan>[
                                TextSpan(
                                  text:
                                      "Sebastian dice:\nBuenas Noches,\n Mi nombre es Sebastian y me gustaría conocer cuáles son las mejores técnicas de adiestramiento. Gracias.",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  children: <TextSpan>[
                                    TextSpan(
                                      //"${comment.data()['comment']}"
                                      text: '\n Noviembre 22 de 2021, 20:25',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ]))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          //height: 100,
                          child: Card(
                              elevation: 2,
                              color: Colors.grey.shade300,
                              child: Text.rich(TextSpan(children: <InlineSpan>[
                                TextSpan(
                                  text:
                                      "Claro que si Sebastian. Por favor, te pedimos tus datos de contacto y unos de nuestros colaboradores se contactará contigo para entregarte toda la información que necesites saber.",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      //"${comment.data()['comment']}"
                                      text: '\n Noviembre 22 de 2021, 20:27',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                )
                              ]))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
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

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("ANIMIO"),
    content: Text("El nuevo Usuario ha sido creado en el Sistema."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
