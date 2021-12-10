import 'package:firebase_core/firebase_core.dart';
import 'package:animio/Feed_page.dart';
import 'package:animio/adoptame.dart';
import 'package:animio/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animio/model/publicacion.dart';
import 'package:animio/controllers/autenticar_controller.dart';
import 'package:loggy/loggy.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  AutenticarController authCtrl = AutenticarController();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  List<publicacion> publicaciones = [];
  TextEditingController controladorComentario = TextEditingController();
  int _counter = 0;

// Metodo para finalizar sesion
  _logout() async {
    try {
      await authCtrl.logOut();
    } catch (e) {
      logError(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void _Refresh() {
    setState(() {
      _counter++;
    });
  }

  agregarItem(publicacion item) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => FeedPage(
                      itemPublicacion: item,
                    )));
      },
      child: new Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                width: MediaQuery.of(context).size.width * 0.75,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text.rich(TextSpan(children: <InlineSpan>[
                      TextSpan(
                        text: item.informacion.substring(
                            1,
                            item.informacion.length > 100
                                ? 100
                                : item.informacion.length),
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      )
                    ]))),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      FontAwesomeIcons.chevronRight,
                      size: 20,
                    )),
              )
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
                        text: item.fecha,
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
      list.add(agregarItem(publicaciones.elementAt(i)));
    }
    return new Row(children: <Widget>[
      SizedBox(
          width: MediaQuery.of(context).size.width - 25,
          child: new Column(children: list)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text("ANIMIO"),
        actions: <Widget>[
          PopupMenuButton<int>(
            onSelected: showMenuSelection,
            child: Row(
              children: <Widget>[
                Text('Menú   '),
                Icon(
                  FontAwesomeIcons.bars,
                  size: 16,
                )
              ],
            ),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 1, child: Text('Adoptar una Mascota')),
              PopupMenuItem<int>(value: 2, child: Text('Maps - Localización')),
              PopupMenuItem<int>(value: 3, child: Text('Chatea con Nosotros')),
              PopupMenuItem<int>(value: 4, child: Text('Salir')),
            ],
          ),
        ],
        backgroundColor: Colors.indigo.shade900,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(children: <Widget>[
                      Row(
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width) - 20,
                            //height: 100,
                            child: Container(
                              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                              margin: EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 10, bottom: 0),
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
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width) - 30,
                            child: Container(
                              height: 34,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.red.shade900,
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextButton(
                                onPressed: () {
                                  var item = new publicacion();
                                  item.informacion = controladorComentario.text;
                                  publicaciones.add(item);
                                  _Refresh();
                                  controladorComentario.text = "";
                                },
                                child: Text(
                                  'Publicar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ]),
                    refrezcarPublicaciones(),
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
      case 4:
        _logout();
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
