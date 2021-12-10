import 'package:animio/model/comentario.dart';

class publicacion {
  String usuario = 'Patricia Martinez Rodriguez';
  String informacion = "";
  String img = "";
  String fecha = (new DateTime.now()).toString();
  List<comentario> comentarios = [];
  int meGusta = 0;

  publicacion() {}
}
