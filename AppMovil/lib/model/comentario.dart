import 'package:cloud_firestore/cloud_firestore.dart';

class comentario {
  String mensaje;
  Timestamp fecha;
  bool meGusta;
  String usuario;

  late String ID;
  late String IDPublicacion;

  late DocumentReference reference;

  comentario(this.ID, this.IDPublicacion, this.mensaje, this.fecha,
      this.meGusta, this.usuario);

  comentario.fromMap(Map<String, dynamic> map, {required this.reference})
      : assert(map['IDPublicacion'] != null),
        assert(map['mensaje'] != null),
        assert(map['fecha'] != null),
        assert(map['meGusta'] != null),
        assert(map['usuario'] != null),
        IDPublicacion = map['IDPublicacion'],
        mensaje = map['mensaje'],
        fecha = map['fecha'],
        meGusta = map['meGusta'],
        usuario = map['usuario'];

  comentario.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  toJson(String? usuario) {
    return {
      'IDPublicacion': IDPublicacion,
      'mensaje': mensaje,
      'fecha': Timestamp.now(),
      'meGusta': meGusta,
      'usuario': usuario
    };
  }

  @override
  String toString() => "Persona<$mensaje:$meGusta>";
}
