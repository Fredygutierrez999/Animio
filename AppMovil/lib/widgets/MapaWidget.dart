import 'package:flutter/material.dart';

// Widget encargado de la creacion de una persona
class MapaWidget extends StatefulWidget {
  const MapaWidget({Key? key}) : super(key: key);

  @override
  _MapaWidgetWidget createState() => _MapaWidgetWidget();
}

class _MapaWidgetWidget extends State<MapaWidget> {
  // Se altera el ciclo vida del Widget para el inicio
  @override
  void initState() {
    super.initState();
  }

  // Se altera el ciclo vida del Widget para la destruccion
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Column build(BuildContext context) {
     return Column(children: [
      Column(children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width) - 20,
              //height: 100,
              child: Container(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                margin:
                    EdgeInsets.only(left: 5.0, right: 5.0, top: 10, bottom: 0),
                height: 70,
                child: TextField(
                  onSubmitted: (value) {},
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Mapa',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
        
      ]),
      new Row(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 0),
            child: Text.rich(TextSpan(children: <InlineSpan>[
              TextSpan(
                text: "Todas las publicaciones",
                style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              )
            ])),
          )
        ],
      )
    ]);
  }
}
