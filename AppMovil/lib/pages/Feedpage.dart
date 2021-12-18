import 'package:animio/controllers/autenticar_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:animio/model/comentario.dart';
import 'package:animio/model/publicacion.dart';
import 'package:animio/controllers/comentarios_controller.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class FeedPage extends StatefulWidget {
  late publicacion item;
  FeedPage({required publicacion itemPublicacion}) {
    item = itemPublicacion;
  }
  @override
  _FeedPageState createState() => _FeedPageState(itemPublicacion: item);
}

class _FeedPageState extends State<FeedPage> {
  late ScrollController _scrollController;
  AutenticarController authenticationController = Get.find();
  ComentariosController comentarioController = Get.find();

  TextEditingController controladorComentario = TextEditingController();
  int _counter = 0;
  late publicacion itemPublicacion;

// Widget que se encarga de mostrar los mensajes
  Widget _item(comentario item, int posicion, String uid) {
    logInfo('Persona? -> ${item.toString()}');
    return _agregarItem(item);
  }

  // Widget que se encarga de la creacion del listado
  Widget _list() {
    String uid = authenticationController.mail();
    logInfo('Id del usuario actual $uid');
    return GetX<ComentariosController>(builder: (controller) {
      WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());
      // Ordenar por fechas
      comentarioController.records.sort((a, b) => a.fecha.compareTo(b.fecha));
      return ListView.builder(
        itemCount: comentarioController.records.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          var element = comentarioController.records[index];
          return _item(element, index, uid);
        },
      );
    });
  }

  // Metodo encargado de la animacion del scroll
  _scrollToEnd() async {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  marcarMeGusta(comentario item) {
    item.meGusta = !item.meGusta;
    comentarioController.actualizar(item);
    _Refresh();
  }

  void _Refresh() {
    setState(() {
      _counter++;
    });
  }

  _agregarItem(comentario item) {
    return new GestureDetector(
      child: new Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        margin: EdgeInsets.only(bottom: 10),
        width: 900,
        child: new Column(
          children: [
            new Row(children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(item.usuario.substring(1, 2)),
                  maxRadius: 15,
                  //foregroundImage: NetworkImage("enterImageUrl"),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.64,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text.rich(TextSpan(children: <InlineSpan>[
                      TextSpan(
                        text: item.mensaje.substring(
                            1,
                            item.mensaje.length > 100
                                ? 100
                                : item.mensaje.length),
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ]))),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
                child: new TextButton(
                    onPressed: () {
                      marcarMeGusta(item);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      shadowColor: Colors.black,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text.rich(TextSpan(
                        children: <InlineSpan>[
                          WidgetSpan(
                            child: Icon(
                              Icons.favorite,
                              color: (item.meGusta ? Colors.pink : Colors.grey),
                              size: 20.0,
                            ),
                          )
                        ],
                      )),
                    )),
              ),
            ]),
            new Row(children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Container(
                    padding: EdgeInsets.only(top: 10, left: 5),
                    child: Text.rich(TextSpan(children: <InlineSpan>[
                      TextSpan(
                        text: item.usuario,
                        style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      )
                    ]))),
              )
            ]),
            new Row(children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Container(
                    padding: EdgeInsets.only(top: 4, left: 5),
                    child: Text.rich(TextSpan(children: <InlineSpan>[
                      TextSpan(
                        text: item.fecha.toDate().toString(),
                        style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      )
                    ]))),
              )
            ])
          ],
        ),
      ),
    );
  }

/*
  cargaComentario() {
    List<Widget> list = [];
    for (var i = 0; i < itemPublicacion.comentarios.length; i++) {
      list.add(new SizedBox(
        height: 10,
      ));
      list.add(new TextButton(
          onPressed: () {
            itemPublicacion.comentarios.elementAt(i).meGusta =
                !itemPublicacion.comentarios.elementAt(i).meGusta;
            _Refresh();
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            shadowColor: Colors.black,
          ),
          child: new Row(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.69,
              child: new Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
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
                      style: TextStyle(fontSize: 10, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n\n ' +
                              itemPublicacion.comentarios.elementAt(i).fecha,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        )
                      ],
                    ),
                    WidgetSpan(
                      child: Icon(
                        Icons.favorite,
                        color: (itemPublicacion.comentarios.elementAt(i).meGusta
                            ? Colors.pink
                            : Colors.grey),
                        size: 20.0,
                      ),
                    )
                  ]))),
            )
          ])));
    }
    return new Row(children: <Widget>[
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.1,
      ),
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: new Column(children: list)),
    ]);
  }
  */

  // ignore: unused_element
  _FeedPageState({required publicacion itemPublicacion}) : super() {
    this.itemPublicacion = itemPublicacion;
  }

  @override
  Widget build(BuildContext context) {
    _scrollController = ScrollController();
    comentarioController.iniciar(this.itemPublicacion.reference.id);
    controladorComentario.addListener(() {});
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Card(
                            child: Text.rich(TextSpan(children: <InlineSpan>[
                          TextSpan(
                            text: "Feed del Contenido",
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ]))),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child:
                                Text(itemPublicacion.usuario.substring(1, 2)),
                            maxRadius: 15,
                            //foregroundImage: NetworkImage("enterImageUrl"),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
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
                                    text: '\n ' +
                                        itemPublicacion.fecha
                                            .toDate()
                                            .toString(),
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
                                TextButton(
                                  onPressed: () {
                                    itemPublicacion.meGusta = 1;
                                    _Refresh();
                                  },
                                  child: Text.rich(
                                    TextSpan(children: <InlineSpan>[
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.thumb_up,
                                          color: (itemPublicacion.meGusta == 1
                                              ? Colors.blue
                                              : Colors.grey),
                                          size: 20.0,
                                        ),
                                      ),
                                    ]),
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                          child: Column(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    itemPublicacion.meGusta = 2;
                                    _Refresh();
                                  },
                                  child: Text.rich(
                                    TextSpan(children: <InlineSpan>[
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.thumb_down,
                                          color: (itemPublicacion.meGusta == 2
                                              ? Colors.blue
                                              : Colors.grey),
                                          size: 20.0,
                                        ),
                                      ),
                                    ]),
                                  ))
                            ],
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
                              child: Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: itemPublicacion.informacion,
                                    style: TextStyle(
                                      fontSize: 13,
                                      textBaseline: TextBaseline.alphabetic,
                                    ),
                                  )
                                ]),
                                textAlign: TextAlign.justify,
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Card(
                            child: Text.rich(TextSpan(children: <InlineSpan>[
                          TextSpan(
                            text: "Comentarios",
                            style: TextStyle(
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                        ]))),
                      ],
                    ),
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
                                var item = new comentario(
                                    "",
                                    itemPublicacion.reference.id,
                                    controladorComentario.text,
                                    Timestamp.now(),
                                    false,
                                    authenticationController.mail());
                                comentarioController.agregar(item);
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
                    SizedBox(
                        height: MediaQuery.of(context).size.height - 400,
                        child: _list()),
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
