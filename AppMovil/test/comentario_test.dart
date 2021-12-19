import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animio/model/comentario.dart';

void main() {
  test('Probar modelo clase comentarios', () {
    final counter = new comentario("IDUNICO", "123hk123", "Mi comentario", Timestamp.now(), true, "a@b.com");
    expect(counter.ID, "IDUNICO");
    expect(counter.IDPublicacion, "123hk123");
    expect(counter.mensaje, "Mi comentario");
    expect(counter.usuario, "a@b.com");
  });
}