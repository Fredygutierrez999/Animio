import 'package:flutter/material.dart';
import 'package:animio/controllers/autenticar_controller.dart';
import 'RegistrarPage.dart';
import 'package:loggy/loggy.dart';
import 'package:get/get.dart';

class AutenticarPage extends StatefulWidget {
  const AutenticarPage({Key? key}) : super(key: key);

  @override
  _AutenticarPageState createState() => _AutenticarPageState();
}

class _AutenticarPageState extends State<AutenticarPage> {
  final EmailCtrl = TextEditingController();
  final ClaveCtrl = TextEditingController();

  AutenticarController authCtrl = AutenticarController();

  _autenticar(correo, password) async {
    logInfo('Autenticacion de $correo $password');
    try {
      await authCtrl.login(correo, password);
    } catch (err) {
      Get.snackbar(
        "Inicio de Sesión",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    EmailCtrl.text = "a@b.com";
    ClaveCtrl.text = "111111";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: new Text("ANIMIO"),
        ),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('asset/images/logo_dogs.png')),
              ),
            ),
            Container(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width * 0.70,
              height: 42,
              child: TextField(
                controller: EmailCtrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correo electrónico'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width * 0.70,
              height: 42,
              child: TextField(
                obscureText: true,
                controller: ClaveCtrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Clave:'),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width * 0.50,
              decoration: BoxDecoration(
                  color: Colors.red.shade900,
                  borderRadius: BorderRadius.circular(15)),
              child: TextButton(
                onPressed: () async {
                  await _autenticar(EmailCtrl.text, ClaveCtrl.text);
                },
                child: Text(
                  'Ingresar al Sistema',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width * 0.50,
              decoration: BoxDecoration(
                  color: Colors.lime.shade900,
                  borderRadius: BorderRadius.circular(15)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Registro()));
                },
                child: Text(
                  'Registrate',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
