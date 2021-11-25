import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
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
                                text: "Feed del Contenido",
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
                    Row(children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                      ),
                      SizedBox(
                        child: Container(
                            alignment: Alignment.bottomCenter,
                            width: MediaQuery.of(context).size.width * 0.25,
                            /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/

                            child: Image.asset('asset/images/foto1.png')),
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
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text("PM"),
                            maxRadius: 15,
                            //foregroundImage: NetworkImage("enterImageUrl"),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.60,
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
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text.rich(
                                  TextSpan(children: <InlineSpan>[
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.thumb_up,
                                        color: Colors.blue,
                                        size: 20.0,
                                      ),
                                    ),
                                  ]),
                                )
                              ]),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                          child: Text.rich(
                            TextSpan(children: <InlineSpan>[
                              WidgetSpan(
                                child: Icon(
                                  Icons.thumb_down,
                                  color: Colors.grey,
                                  size: 20.0,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
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
                              elevation: 2,
                              child: Text.rich(TextSpan(children: <InlineSpan>[
                                TextSpan(
                                  text:
                                      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.",
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
                      height: 2,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.12,
                          //foregroundImage: NetworkImage("enterImageUrl"),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          //height: 100,
                          child: Card(
                              color: Colors.grey.shade300,
                              child: Text.rich(TextSpan(children: <InlineSpan>[
                                TextSpan(
                                  text:
                                      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. ",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                  children: <TextSpan>[
                                    TextSpan(
                                      //"${comment.data()['comment']}"
                                      text:
                                          '\n Noviembre 21 de 2021, 06:35a.m.',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                WidgetSpan(
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                    size: 20.0,
                                  ),
                                ),
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
