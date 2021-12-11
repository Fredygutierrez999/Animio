import 'dart:async';

import 'package:animio/model/comentario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

// Controlador encargado del manejo de los datos de las persona
class ComentariosController extends GetxController {
  // Variable reactiva
  final _records = <comentario>[].obs;
  // Instancia de la coleccion de base de datos
  final CollectionReference datos =
      FirebaseFirestore.instance.collection("comentarios");
  // Instancia para manejo de la base de datos
  final Stream<QuerySnapshot> _operaciones =
      FirebaseFirestore.instance.collection("comentarios").snapshots();
  // Subscripcion de cambios
  late StreamSubscription<Object?> streamSubscription;
  // Getter
  List<comentario> get records => _records;

  // Metodo para iniciar los listener
  iniciar() {
    logInfo('Inicio de subscripciones a Firestore');
    streamSubscription = _operaciones.listen((event) {
      logInfo('Se obtuvo un nuevo registro de fireStore');
      _records.clear();
      for (var item in event.docs) {
        _records.add(comentario.fromSnapshot(item));
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
  Future<void> agregar(comentario item) async {
    String? usuario = FirebaseAuth.instance.currentUser!.email;
    try {
      datos
          .add(item.toJson(usuario))
          .then((value) => logInfo('Comentario creada!'))
          .catchError((error) => logError('Comentario no creada: $error'));
    } catch (e) {
      logError('Comentario no creada: $e');
      return Future.error(e);
    }
  }

  Future<void> actualizar(comentario item) async {
    String? usuario = FirebaseAuth.instance.currentUser!.email;
    try {
      datos.add(item.toJson(usuario))
          .then((value) => logInfo('Comentario creada!'))
          .catchError((error) => logError('Comentario no creada: $error'));
    } catch (e) {
      logError('Comentario no creada: $e');
      return Future.error(e);
    }
  }
}
