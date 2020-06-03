import 'package:flutter/material.dart';
import 'package:himnario/data/coro.dart';

class CoroEnLista extends StatefulWidget {
  /* final Coro coro;

  const CoroEnLista({
    @required this.coro,
  }) : assert(coro != null);*/

  @override
  _CoroEnListaState createState() => _CoroEnListaState();
}

class _CoroEnListaState extends State<CoroEnLista> {
  final Coro coro = Coro(
      id: 1,
      nombre: "A Dios sea la gloria",
      searchName: "mimo",
      cuerpo:
          "Este es el mero cuerpo \nque esperamos sea largo\n y en algunos casos tenga estrofas",
      tonalidad: "F",
      velocidad: "R",
      tiempo: 65,
      orden: 2,
      autorMusica: "nadie",
      autorLetra: "naide",
      status: "nada");

  /*final Coro coro;
  _CoroEnListaState({
    @required this.coro,
  }) : assert(coro != null);*/

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        coro.nombre,
        style: TextStyle(fontSize: 16.0),
      ),
      trailing: Icon(Icons.keyboard_arrow_down),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              elevation: 5.0,
              child: Text("Partitura", style: TextStyle(color: Colors.white),),
              color: Colors.blueGrey,
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0.0, 8.0, 0.0),
              child: Text(coro.cuerpo, style: TextStyle(fontSize: 15.0)),
            ),
          ],
        )
      ],
      initiallyExpanded: false,
    );
  }
}
