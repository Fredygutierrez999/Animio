import 'package:animio/model/comentario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class publicacion {
  String informacion;
  String img;
  List<comentario> comentarios = [];
  int meGusta;
  double latitude;
  double longitude;
  double altitude;

  // Auditoria
  late String ID;
  late String usuario;
  late Timestamp fecha;
  // Documento de fecha en Firestore [Obligatorio]
  late DocumentReference reference;

  // Constructor
  publicacion(this.usuario, this.informacion, this.img, this.fecha, this.meGusta, this.latitude, this.longitude, this.altitude);

// Metodo que se encarga de convertir un mapa en un objeto de registros [Obligatorio]
  publicacion.fromMap(Map<String, dynamic> map, {required this.reference})
      : assert(map['usuario'] != null),
        assert(map['informacion'] != null),
        assert(map['img'] != null),
        assert(map['fecha'] != null),
        assert(map['meGusta'] != null),
        assert(map['latitude'] != null),
        assert(map['longitude'] != null),
        assert(map['altitude'] != null),
        usuario = map['usuario'],
        informacion = map['informacion'],
        img = map['img'],
        fecha = map['fecha'],
        meGusta = map['meGusta'],
        latitude = map['latitude'],
        longitude = map['longitude'],
        altitude = map['altitude'];

// Metodo que se encarga de convertir un Documento de la base de datos
  // a un mapa de flutter [Obligatorio]
  publicacion.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  // Metodo para serializar a JSON
  toJson(String? usuario) {
    return {
      'usuario': usuario,
      'informacion': informacion,
      'img': img,
      'fecha': Timestamp.now(),
      'meGusta': meGusta,
      'latitude': latitude,
      'longitude': longitude,
      'altitude': altitude,
    };
  }

  // Se sobre escribe el metodo de toString
  @override
  String toString() => "Persona<$usuario:$informacion:$meGusta>";
}
