import 'package:flutter/cupertino.dart';

class Coro {
  final int id;
  final String nombre;
  final String cuerpo;
  final String tonalidad;
  final String tonAlt;
  final String velocidad;
  final int tiempo;
  final int orden;
  final String autorLetra;
  final String autorMusica;
  final String cita;
  final String historia;
  final String status;

  //no se si incluir estos dos ultimos
  final String audio;
  final String partitura;

  const Coro({
    @required this.id,
    @required this.nombre,
    @required this.cuerpo,
    @required this.tonalidad,
    @required this.velocidad,
    @required this.tiempo,
    @required this.orden,
    @required this.autorLetra,
    @required this.autorMusica,
    @required this.status,
    this.cita,
    this.historia,
    this.audio,
    this.partitura,
    this.tonAlt,
  })  : assert(id != null),
        assert(nombre != null),
        assert(cuerpo != null),
        assert(tonalidad != null),
        assert(velocidad != null),
        assert(tiempo != null),
        assert(orden != null),
        assert(autorLetra != null),
        assert(autorMusica != null),
        assert(status != null);
}
