import 'dart:html';
import 'package:flutter/material.dart';
import 'model/comentario.dart';
import 'model/publicacion.dart';


class FeedPage extends StatefulWidget {
  publicacion item = new publicacion();

  FeedPage({required publicacion itemPublicacion}) {
    item = itemPublicacion;
  }
 
  @override
  _FeedPageState createState() => _FeedPageState(itemPublicacion: item);
}

class _FeedPageState extends State<FeedPage> {
  TextEditingController controladorComentario = TextEditingController();
  int _counter = 0;
  publicacion itemPublicacion = new publicacion();

  @override
  void initState() {
    super.initState();
    controladorComentario.addListener(() {});
  }

  void _Refresh() {
    setState(() {
      _counter++;
    });
  }

  cargaComentario() {
    List<Widget> list = [];
    for (var i = 0; i < itemPublicacion.comentarios.length; i++) {
      list.add(new Row(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.70,
          child: new Container(
              margin:
                  EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10, right: 5),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text.rich(TextSpan(children: <InlineSpan>[
                WidgetSpan(
                  child: Icon(
                    Icons.insert_emoticon_sharp,
                    color: Colors.grey,
                    size: 20.0,
                  ),
                ),
                TextSpan(
                  text: itemPublicacion.comentarios.elementAt(i).mensaje,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n\n ' + itemPublicacion.comentarios.elementAt(i).fecha,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ]))),
        )
      ]));
    }
    return new Row(children: <Widget>[
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.10,
      ),
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.70,
          child: new Column(children: list)),
      SizedBox(
        width: 10,
      )
    ]);
  }

  // ignore: unused_element
  _FeedPageState({required publicacion itemPublicacion}): super() {
    this.itemPublicacion = itemPublicacion;
  }

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
                                text: itemPublicacion.usuario,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    //"${comment.data()['comment']}"
                                    text: '\n ' + itemPublicacion.fecha,
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
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text.rich(TextSpan(children: <InlineSpan>[
                                TextSpan(
                                  text: itemPublicacion.informacion,
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
                      width: 10,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    cargaComentario(),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.10,
                          //foregroundImage: NetworkImage("enterImageUrl"),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.60,
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
                                labelText: 'Nuevo comentario',
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
                                var item = new comentario();
                                item.mensaje = controladorComentario.text;
                                itemPublicacion.comentarios.add(item);
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
