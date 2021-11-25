import 'package:animio/Feed_page.dart';
import 'package:animio/adoptame.dart';
import 'package:animio/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ANIMIO"),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: showMenuSelection,
            child: Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.bars),
                Text('Menú de Opciones'),
              ],
            ),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 1, child: Text('Adoptar una Mascota')),
              PopupMenuItem<int>(value: 2, child: Text('Maps - Localización')),
              PopupMenuItem<int>(value: 3, child: Text('Chatea con Nosotros')),
            ],
          ),
        ],
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
                            width: 90,
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
                                text: "NUESTRAS PUBLICACIONES ",
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
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text("PM"),
                            maxRadius: 15,
                            //foregroundImage: NetworkImage("enterImageUrl"),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.50,
                            child: Text.rich(TextSpan(children: <InlineSpan>[
                              TextSpan(
                                text: 'Patricia Martinez Rodriguez',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    //"${comment.data()['comment']}"
                                    text: '\n Noviembre 20 de 2021, 8:33a.m.',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              )
                            ]))),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text.rich(
                                  TextSpan(children: <InlineSpan>[
                                    WidgetSpan(
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          FeedPage()));
                                            },
                                            icon: Icon(Icons.comment))),
                                  ]),
                                )
                              ]),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          child: Container(
                              alignment: Alignment.bottomRight,
                              width: MediaQuery.of(context).size.width * 0.10,
                              /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/

                              child: Image.asset('asset/images/foto1.png')),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          //height: 100,
                          child: Card(
                              elevation: 2,
                              child: Text.rich(TextSpan(children: <InlineSpan>[
                                TextSpan(
                                  text:
                                      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ]))),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(children: <Widget>[
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text("AF"),
                              maxRadius: 15,
                              //foregroundImage: NetworkImage("enterImageUrl"),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: Text.rich(TextSpan(children: <InlineSpan>[
                                TextSpan(
                                  text: 'Alejandro Fernandez M.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      //"${comment.data()['comment']}"
                                      text:
                                          '\n Noviembre 18 de 2021, 11:11a.m.',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                )
                              ]))),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text.rich(
                                    TextSpan(children: <InlineSpan>[
                                      WidgetSpan(
                                          child: IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            FeedPage()));
                                              },
                                              icon: Icon(Icons.comment))),
                                    ]),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ]),
                    Column(children: <Widget>[
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            child: Container(
                                alignment: Alignment.bottomRight,
                                width: MediaQuery.of(context).size.width * 0.10,
                                /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/

                                child: Image.asset('asset/images/foto2.png')),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.70,
                            //height: 100,
                            child: Card(
                                elevation: 2,
                                child:
                                    Text.rich(TextSpan(children: <InlineSpan>[
                                  TextSpan(
                                    text:
                                        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. ",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ]))),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    ]),
                    SizedBox(
                      height: 20,
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

  void showMenuSelection(int value) {
    switch (value) {
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => Adoptame()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => Chatpage()));
        break;

      // Other cases for other menu options
    }
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
