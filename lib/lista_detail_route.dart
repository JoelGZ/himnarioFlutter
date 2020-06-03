import 'package:flutter/material.dart';

import 'data/lista.dart';
import 'minor_widgets/coro_en_lista.dart';

class ListaDetailRoute extends StatefulWidget {
  final Lista lista;

  const ListaDetailRoute({
    @required this.lista,
  }) : assert(lista != null);

  @override
  _ListaDetailRouteState createState() => _ListaDetailRouteState(lista: lista);
}

class _ListaDetailRouteState extends State<ListaDetailRoute> {

  final Lista lista;

  _ListaDetailRouteState({
    @required this.lista,
  }) : assert(lista != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lista.nombre),),
      body: Container(child: CoroEnLista(),),
    );
  }
}
