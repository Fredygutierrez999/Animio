import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animio/controllers/autenticar_controller.dart';
import 'package:animio/controllers/publicacion_controller.dart';
import 'controllers/PermissionManager.dart';
import 'controllers/PermissionsController.dart';
import 'controllers/ThemeController.dart';
import 'controllers/ThemeManager.dart';
import 'controllers/comentarios_controller.dart';
import 'controllers/location_controller.dart';
import 'pages/PrincipalPage.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Se inicializa el contexto de firebase
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
// Dependency injection: setting up state management
  late final ThemeController controller = Get.put(ThemeController());
  // Theme management
  late final ThemeManager manager = ThemeManager();
  bool isLoaded = false;

  Future<void> initializeTheme() async {
    controller.darkMode = await manager.storedTheme;
    //setState(() => isLoaded = true);
  }

  @override
  void initState() {
    Get.put(AutenticarController());
    Get.put(PublicacionesController());
    Get.put(ComentariosController());
    //Get.put(PermissionsController());
    Get.put(LocationController());

    ever(controller.reactiveDarkMode, (bool isDarkMode) {
      manager.changeTheme(isDarkMode: isDarkMode);
    });
    PermissionsController permissionsController =
        Get.put(PermissionsController());
    permissionsController.permissionManager = PermissionManager();
    Get.lazyPut(() => LocationController());
    initializeTheme();
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MisionTIC',
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
