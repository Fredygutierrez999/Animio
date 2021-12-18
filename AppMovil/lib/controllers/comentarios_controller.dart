import 'dart:async';

import 'package:animio/model/comentario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

// Controlador encargado del manejo de los datos de las persona
class ComentariosController extends GetxController {
  final _records = <comentario>[].obs;
  final CollectionReference datos =
      FirebaseFirestore.instance.collection("comentarios");
  late Stream<QuerySnapshot> _operaciones;
  late StreamSubscription<Object?> streamSubscription;
  List<comentario> get records => _records;

  // Metodo para iniciar los listener
  iniciar(String IDPublicacion) {
    _operaciones = FirebaseFirestore.instance
        .collection("comentarios")
        .where("IDPublicacion", isEqualTo: IDPublicacion)
        .snapshots();
    streamSubscription = _operaciones.listen((event) {
      _records.clear();
      for (var item in event.docs) {
        _records.add(comentario.fromSnapshot(item));
      }
      _records.sort((a, b) => a.fecha.toDate().compareTo(b.fecha.toDate()));
    });
  }

  // Metodo para detener los listener
  detener() {
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
      return Future.error(e);
    }
  }

  Future<void> actualizar(comentario item) async {
    String? usuario = FirebaseAuth.instance.currentUser!.email;
    try {
      datos
          .doc(item.reference.id)
          .update({"meGusta": item.meGusta})
          .then((value) => logInfo('Comentario actualizado!'))
          .catchError((error) => logError('Comentario no creada: $error'));
    } catch (e) {
      //logError('Comentario no creada: $e');
      return Future.error(e);
    }
  }
}
