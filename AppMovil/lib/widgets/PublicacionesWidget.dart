import 'dart:async';

import 'package:animio/controllers/LocationManager.dart';
import 'package:animio/controllers/PermissionsController.dart';
import 'package:animio/controllers/location_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:animio/model/publicacion.dart';
import 'package:animio/pages/Feedpage.dart';
import 'package:animio/controllers/autenticar_controller.dart';
import 'package:animio/controllers/publicacion_controller.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Widget encargado de la creacion de una persona
class PublicacionesWidget extends StatefulWidget {
  const PublicacionesWidget({Key? key}) : super(key: key);

  @override
  _PublicacionesWidget createState() => _PublicacionesWidget();
}

class _PublicacionesWidget extends State<PublicacionesWidget> {
  // Controlador para manejo de scroll
  late ScrollController _scrollController;
  // Inyeccion de controladores
  PublicacionesController Controller = Get.find();
  AutenticarController authenticationController = Get.find();
  List<publicacion> publicaciones = [];
  TextEditingController controladorComentario = TextEditingController();
  late PermissionsController permissionsController;
  late LocationController locationController;
  late LocationManager manager;

  // Se altera el ciclo vida del Widget para el inicio
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    Controller.iniciar();

    permissionsController = Get.find();
    locationController = Get.find();
    manager = LocationManager();

    Timer.periodic(const Duration(seconds: 30), (timer) async {
      // Verifica que tienes los permisos y luego obten la ubicacion
      // Almacenala y tambien muestra un snackbar con los datos
      locationController.location.value = null;
      if (permissionsController.locationGranted) {
        final position = await manager.getCurrentLocation();
        locationController.location.value = position;
        Get.snackbar('Tu ubicación','Latitud ${position.latitude}\nLongitud: ${position.longitude}\nAltitud: ${position.altitude}');
      }
    });
  }

  // Se altera el ciclo vida del Widget para la destruccion
  @override
  void dispose() {
    _scrollController.dispose();
    Controller.detener();
    super.dispose();
  }

  _agregarItem(publicacion item) {
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
                width: MediaQuery.of(context).size.width * 0.76,
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
  refrezcarPublicaciones() {
    List<Widget> list = [];
    for (var i = 0; i < publicaciones.length; i++) {
      list.add(agregarItem(publicaciones.elementAt(i)));
    }
    return new Row(children: <Widget>[
      SizedBox(
          width: MediaQuery.of(context).size.width - 25,
          child: new Column(children: list)),
    ]);
  }*/

  // Widget que se encarga de mostrar los mensajes
  Widget _item(publicacion item, int posicion, String uid) {
    logInfo('Persona? -> ${item.toString()}');
    return _agregarItem(item);
  }

  // Widget que se encarga de la creacion del listado
  Widget _list() {
    String uid = authenticationController.mail();
    logInfo('Id del usuario actual $uid');
    return GetX<PublicacionesController>(builder: (controller) {
      WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());
      // Ordenar por fechas
      Controller.records.sort((a, b) => a.fecha.compareTo(b.fecha));
      return ListView.builder(
        itemCount: Controller.records.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          var element = Controller.records[index];
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

  @override
  Column build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());
    return Column(children: [
      Column(children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width) - 20,
              //height: 100,
              child: Container(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                margin:
                    EdgeInsets.only(left: 5.0, right: 5.0, top: 10, bottom: 0),
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
                  onPressed: () async {
                    String uid = authenticationController.mail();
                    final position = await manager.getCurrentLocation();
                    locationController.location.value = position;
                    Controller.agregar(new publicacion(uid,controladorComentario.text, "img", Timestamp.now(), 0,position.latitude,position.longitude,position.altitude));
                    controladorComentario.text = "";
                  },
                  child: Text(
                    'Publicar',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        )
      ]),
      new Row(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 0),
            child: Text.rich(TextSpan(children: <InlineSpan>[
              TextSpan(
                text: "Todas las publicaciones",
                style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              )
            ])),
          )
        ],
      ),
      SizedBox(height: MediaQuery.of(context).size.height - 200, child: _list())
    ]);
  }
}
