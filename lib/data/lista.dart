import 'package:flutter/cupertino.dart';
import './coro.dart';

class Lista {
  final String nombre;
  final String tonalidad;
  final List<Coro> corosRapidosMedios;
  final List<Coro> corosLentos;
  final String dateAdded;   //esta debe ser guardada con fomrato de fecha, no se como se traduciria de regreso (si seria un STring)

  const Lista({
    @required this.nombre,
    @required this.tonalidad,
    this.corosRapidosMedios,
    this.corosLentos,
    this.dateAdded,
  })  : assert(nombre != null),
        assert(tonalidad != null);
}
