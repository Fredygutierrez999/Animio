

import 'package:firebase_core/firebase_core.dart';
//import 'package:animio/Feed_page.dart';
import 'package:animio/adoptame.dart';
import 'package:animio/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animio/model/publicacion.dart';
import 'package:animio/controllers/autenticar_controller.dart';
import 'package:loggy/loggy.dart';
import 'package:animio/widgets/PublicacionesWidget.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  AutenticarController authCtrl = AutenticarController();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  int _counter = 0;

static final List<Widget> _widgets = <Widget>[
    const PublicacionesWidget(),
    //const CrearWidget()
  ];

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
                    
                    PublicacionesWidget()
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
