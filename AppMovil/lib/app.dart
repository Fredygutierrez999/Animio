import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animio/controllers/autenticar_controller.dart';
import 'package:animio/controllers/publicacion_controller.dart';
import 'controllers/comentarios_controller.dart';
import 'pages/PrincipalPage.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class App extends StatelessWidget {
  // Se inicializa el contexto de firebase
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // Constructor
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Demo - MisionTIC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          body: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            logError("error ${snapshot.error}");
            return const Wrong();
          }
          if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.waiting) {
            Get.put(AutenticarController());
            Get.put(PublicacionesController());
            Get.put(ComentariosController());
            return const PrincipalPage();
          }
          return const Loading();
        },
      )),
    );
  }
}

class Wrong extends StatelessWidget {
  const Wrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Ocurrio un error!"));
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
