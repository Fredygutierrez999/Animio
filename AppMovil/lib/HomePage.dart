import 'package:animio/Feed_page.dart';
import 'package:animio/adoptame.dart';
import 'package:animio/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'model/publicacion.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<publicacion> publicaciones = [];
  TextEditingController controladorComentario = TextEditingController();
  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }

  void _Refresh() {
    setState(() {
      _counter++;
    });
  }

  refrezcarPublicaciones() {
    List<Widget> list = [];
    for (var i = 0; i < publicaciones.length; i++) {
      list.add(new Row(
        children: [
          SizedBox(
            height: 30,
          )
        ],
      ));

      list.add(new Row(
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
                  text: publicaciones.elementAt(i).usuario,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      //"${comment.data()['comment']}"
                      text: '\n ' + publicaciones.elementAt(i).fecha,
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
                                        builder: (_) => FeedPage(
                                              itemPublicacion:
                                                  publicaciones.elementAt(i),
                                            )));
                              },
                              icon: Icon(Icons.comment))),
                    ]),
                  )
                ]),
          ),
        ],
      ));

      list.add(new Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: Container(
                alignment: Alignment.bottomRight,
                width: MediaQuery.of(context).size.width * 0.10,
                child: Image.asset('asset/images/foto1.png')),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            //height: 100,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text.rich(TextSpan(children: <InlineSpan>[
                  TextSpan(
                    text: publicaciones.elementAt(i).informacion,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  )
                ]))),
          ),
        ],
      ));
    }
    return new Row(children: <Widget>[
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: new Column(children: list)),
    ]);
  }

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
                    refrezcarPublicaciones(),
                    SizedBox(
                      height: 20,
                    ),
                    Column(children: <Widget>[
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.70,
                            //height: 100,
                            child: Container(
                              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              margin: EdgeInsets.symmetric(vertical: 10),
                              width: MediaQuery.of(context).size.width * 0.50,
                              height: 70,
                              child: TextField(
                                onSubmitted: (value) {},
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  labelText: 'Nueva publicación',
                                  border: OutlineInputBorder(),
                                ),
                                controller: controladorComentario,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1,
                            child: Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                  color: Colors.red.shade900,
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextButton(
                                onPressed: () {
                                  var item = new publicacion();
                                  item.informacion = controladorComentario.text;
                                  publicaciones.add(item);
                                  _Refresh();
                                  controladorComentario.text = "";
                                },
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ])
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
