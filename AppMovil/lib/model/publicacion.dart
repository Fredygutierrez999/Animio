import 'package:animio/model/comentario.dart';

class publicacion {
  String usuario = 'Patricia Martinez Rodriguez';
  String informacion = "";
  String fecha = (new DateTime.now()).toString();
  List<comentario> comentarios = [];

  publicacion() {}
}
