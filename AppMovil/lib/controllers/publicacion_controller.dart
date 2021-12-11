import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animio/model/publicacion.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

// Controlador encargado del manejo de los datos de las persona
class PublicacionesController extends GetxController {


  // Variable reactiva
  final _records = <publicacion>[].obs;
  // Instancia de la coleccion de base de datos
  final CollectionReference personas = FirebaseFirestore.instance.collection("publicaciones");
  // Instancia para manejo de la base de datos
  final Stream<QuerySnapshot> _operaciones = FirebaseFirestore.instance.collection("publicaciones").snapshots();
  // Subscripcion de cambios
  late StreamSubscription<Object?> streamSubscription;
  // Getter
  List<publicacion> get records => _records;

  // Metodo para iniciar los listener
  iniciar() {
    logInfo('Inicio de subscripciones a Firestore');
    streamSubscription = _operaciones.listen((event) {
      logInfo('Se obtuvo un nuevo registro de fireStore');
      _records.clear();
      for (var item in event.docs) {
        _records.add(publicacion.fromSnapshot(item));
      }
      _records.sort((a, b) => a.fecha.toDate().compareTo(b.fecha.toDate()));
      logInfo('Se obtuvieron ${_records.length} registros');
    });
  }

  // Metodo para detener los listener
  detener() {
    logInfo('Finalizacion de subscripciones a Firestore');
    streamSubscription.cancel();
  }

  // Metodo para crear una persona
  Future<void> agregar(publicacion persona) async {
    String? usuario = FirebaseAuth.instance.currentUser!.email;
    try {
      personas
          .add(persona.toJson(usuario))
          .then((value) => logInfo('Persona creada!'))
          .catchError((error) => logError('Persona no creada: $error'));
    } catch (e) {
      logError('Persona no creada: $e');
      return Future.error(e);
    }
  }

  
}
