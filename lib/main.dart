import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Center(child: Volleyball()),
          ),
        ),
      ),
    );
  }
}

class JugarVolleyball {
  Future<String> lanzarBalon() async {
    return Future.delayed(Duration(milliseconds: 100), () {
      return 'Izquierda';
    });
  }

  Future<String> balonArriba() async {
    return Future.delayed(Duration(milliseconds: 100), () {
      return 'Arriba';
    });
  }

  Future<String> reLanzarBalon() async {
    return Future.delayed(Duration(milliseconds: 100), () {
      return 'Derecha';
    });
  }
}

class Volleyball extends StatefulWidget {
  Volleyball({Key key}) : super(key: key);

  @override
  _VolleyballState createState() => _VolleyballState();
}

class _VolleyballState extends State<Volleyball> {
  final jugar = JugarVolleyball();
  String posicionBalon = "Derecha";
  String balon =
      "https://www.pngitem.com/pimgs/m/403-4033159_volleyball-png-image-transparent-background-volleyball-icon-png.png";
  String malla =
      "https://www.redesdevoleibol.com/images/Red_boli_colores.png";
  String punio =
      "https://images.vexels.com/media/users/3/164150/isolated/preview/2bdf5fe086971f7f388cd12d0f8c4e2e-mano-dedo-pu--o-s-letra-s-ilustraci--n-by-vexels.png";
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            width: 150,
            child: posicionBalon == "Arriba"
                ? Container(width: 100, height:300 , child: Image.network(balon))
                : Container(
                    height: 300,
                  )),
        Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: posicionBalon == "Izquierda"
                    ? Container(width: 100, child: Image.network(balon))
                    : Container()),
            Expanded(
                flex: 2,
                child: Container(width: 100, child: Image.network(malla))),
            Expanded(
                flex: 2,
                child: posicionBalon == "Derecha"
                    ? Container(width: 100, child: Image.network(balon))
                    : Container())
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: posicionBalon == "Izquierda"
                    ? Container(
                        width: 100,
                        child: InkWell(
                            child: Image.network(punio),
                            onTap: () async {
                              posicionBalon = await jugar.balonArriba();
                              setState(() {});
                              posicionBalon = await jugar.reLanzarBalon();
                              setState(() {});
                            }))
                    : Container()),
            Expanded(
                flex: 2,
                child: Container(
                  width: 100,
                )),
            Expanded(
                flex: 2,
                child: posicionBalon == "Derecha"
                    ? Container(
                        width: 100,
                        child: InkWell(
                            child: Image.network(punio),
                            onTap: () async {
                              posicionBalon = await jugar.balonArriba();
                              setState(() {});
                              posicionBalon = await jugar.lanzarBalon();
                              setState(() {});
                            }))
                    : Container())
          ],
        ),
      ],
    ));
  }

  void cambioEstado() async {
    posicionBalon = await jugar.balonArriba();
    setState(() {});
  }
}
