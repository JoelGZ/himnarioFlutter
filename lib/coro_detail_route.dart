import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himnario/data/coro.dart';

const double _paddingSubheadings = 12.0;
const double _leftPaddingText = 20.0;

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

  Widget _buildInformacionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
      Container(
        color: Colors.grey[500],
        child: Padding(
          padding: const EdgeInsets.all(_paddingSubheadings),
          child: Text(
            "Información General",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
      Padding(
          padding: EdgeInsets.fromLTRB(_leftPaddingText, 12.0, 8.0, 12.0),
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
    ],);
  }

  Widget _buildHistoriaWidget() {
    var showCita = coro.cita != null;
    var showHistoria = coro.historia != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.grey[500],
          child: Padding(
            padding: const EdgeInsets.all(_paddingSubheadings),
            child: Text(
              "Historia",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(_leftPaddingText, 12.0, 8.0, 12.0),
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
              ///Conditional rendering of cita info
              showCita ? Row(
                children: <Widget>[
                  Text(
                    "Cita: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(coro.cita),
                ],
              ) : Container(height: 0, width: 0,),
              ///Conditional rendering of historia info
              showHistoria ? Row(
                children: <Widget>[
                  Text(
                    "Historia: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(coro.historia),
                ],
              ) : Container(height: 0, width: 0,)
            ],
          ),
        ),
      ],);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      ///https://www.youtube.com/watch?v=YuW-4OXy6SE
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  coro.nombre,
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
              _buildInformacionWidget(),
              Container(
                color: Colors.grey[500],
                child: Padding(
                  padding: const EdgeInsets.all(_paddingSubheadings),
                  child: Text(
                    "Letra",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(_leftPaddingText, 12.0, 8.0, 12.0),
                child: Text(
                  coro.cuerpo,
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              _buildHistoriaWidget(),
            ]),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text("Letra")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              title: Text("Partitura")
          ),
        ]
      ),
    );
  }
}
