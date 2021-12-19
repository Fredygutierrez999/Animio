import 'package:animio/model/publicacion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Probar modelo clase publicacion', () {
    final counter = new publicacion("IDUSUARIO", "Prueba publicaciòn", "", Timestamp.now(), 1, 37.56, -122.5, 5);
    expect(counter.usuario, "IDUSUARIO");
    expect(counter.informacion, "Prueba publicaciòn");
    expect(counter.latitude, 37.56);
    expect(counter.longitude, -122.5);
  });
}