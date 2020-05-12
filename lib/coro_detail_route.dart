import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:himnario/data/coro.dart';

const double _paddingSubheadings = 8.0;
const double _leftPaddingText = 12.0;

class CoroDetailRoute extends StatelessWidget {
  final Coro coro;

  const CoroDetailRoute({
    @required this.coro,
  }) : assert(coro != null);

  String selectTonalidad(tonalidad) {
    switch (tonalidad) {
      case "C":
        return "Do (C)";
        break;
      case "Eb":
        return "Mi bemol (Eb)";
        break;
      case "F":
        return "Fa (F)";
        break;
      case "G":
        return "Sol (G)";
        break;
      case "Bb":
        return "Si bemol (Bb)";
        break;
      default:
        return tonalidad;
    }
  }

  String selectVelocidad(velocidad) {
    switch (velocidad) {
      case "L":
        return "Lento";
        break;
      case "M":
        return "Medio";
        break;
      case "R":
        return "Rapido";
        break;
      default:
        return velocidad;
    }
  }

  Widget _buildCitaWidget() {
    if (coro.cita != null) {
      return Row(
        children: <Widget>[
          Text(
            "Cita: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(coro.cita),
        ],
      );
    } else {
      return null;
    }
  }

  Widget _buildHistoriaWidget() {
    if (coro.historia != null) {
      return Row(
        children: <Widget>[
          Text(
            "Historia: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(coro.historia),
        ],
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(coro.nombre),
          Container(
            color: Colors.grey[500],
            child: Padding(
              padding: const EdgeInsets.all(_paddingSubheadings),
              child: Text("Información"),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(_leftPaddingText),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Tonalidad: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        selectTonalidad(coro.tonalidad),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Velocidad: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(selectVelocidad(coro.velocidad)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Tiempo: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(coro.tiempo.toString()),
                    ],
                  )
                ],
              )),
          Container(
            color: Colors.grey[500],
            child: Padding(
              padding: const EdgeInsets.all(_paddingSubheadings),
              child: Text("Letra"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_leftPaddingText),
            child: Text(coro.cuerpo),
          ),
          Container(
            color: Colors.grey[500],
            child: Padding(
              padding: const EdgeInsets.all(_paddingSubheadings),
              child: Text("Historia"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_leftPaddingText),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "Autor Letra: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(coro.autorLetra),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Autor Música: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(coro.autorMusica),
                  ],
                ),
                _buildCitaWidget(),
                _buildHistoriaWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
