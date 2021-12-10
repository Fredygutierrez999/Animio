import 'package:flutter/material.dart';
import 'package:animio/controllers/autenticar_controller.dart';
import 'package:get/get.dart';

import 'AutenticarPage.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final EmailCtrl = TextEditingController();
  final ClaveCtrl = TextEditingController();
  final RepClaveCtrl = TextEditingController();

  guardarUsuario(BuildContext context) async {
    List<String> errores = [];
    if (EmailCtrl.text.isEmpty) {
      errores.add("Debe ingresar un usuario");
    }
    if (ClaveCtrl.text.isEmpty) {
      errores.add("Debe ingresar la clave");
    }
    if (RepClaveCtrl.text.isEmpty) {
      errores.add("Debe ingresar la repetición de la clave");
    }
    if (ClaveCtrl.text.isNotEmpty && RepClaveCtrl.text.isNotEmpty) {
      // ignore: unrelated_type_equality_checks
      if (RepClaveCtrl.text != ClaveCtrl.text) {
        errores.add("Las contraseñas no son las mismas.");
      }
    }
    if (errores.length == 0) {
      AutenticarController authCtrl = AutenticarController();
      try {
        await authCtrl.signUp(EmailCtrl.text, ClaveCtrl.text);
        EmailCtrl.text = "@";
        ClaveCtrl.text = "";
        RepClaveCtrl.text = "";
        // set up the button
        Widget okButton = TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );

        // set up the AlertDialog
        AlertDialog alert = AlertDialog(
          title: Text("ANIMIO"),
          content: Text("El nuevo Usuario ha sido creado en el Sistema."),
          actions: [
            okButton,
          ],
        );

        // show the dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      } catch (err) {
        Get.snackbar(
          "Registro de usuario",
          err.toString(),
          icon: const Icon(Icons.person, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
        );
      }
    } else {
      Get.snackbar(
        "Registro de usuario",
        errores.first,
        icon: const Icon(Icons.person, color: Colors.yellow),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    EmailCtrl.text = "@";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ANIMIO"),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Center(
                        child: Container(
                            width: 70,
                            /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                            child: Image.asset('asset/images/logo_dogs.png')),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Registrarse",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: MediaQuery.of(context).size.width * 0.70,
                      height: 42,
                      child: TextField(
                        controller: EmailCtrl,
                        decoration: InputDecoration(
                          labelText: 'Correo electrónico',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Clave / Contraseña",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: MediaQuery.of(context).size.width * 0.70,
                      height: 42,
                      child: TextField(
                        controller: ClaveCtrl,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'Clave'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: MediaQuery.of(context).size.width * 0.70,
                      height: 42,
                      child: TextField(
                        controller: RepClaveCtrl,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirmar Clave'),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width * 0.20,
                              decoration: BoxDecoration(
                                  color: Colors.cyan.shade900,
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextButton(
                                onPressed: () {
                                  guardarUsuario(context);
                                },
                                child: Text(
                                  'Grabar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width * 0.20,
                              decoration: BoxDecoration(
                                  color: Colors.red.shade900,
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancelar',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
