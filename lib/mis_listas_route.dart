import 'package:flutter/material.dart';
import 'package:himnario/minor_widgets/drawer.dart';
import 'package:himnario/minor_widgets/lista_item.dart';
import 'package:himnario/data/lista.dart';

import 'data/lista.dart';

class MisListasRoute extends StatefulWidget {
  @override
  _MisListasRouteState createState() => _MisListasRouteState();
}

class _MisListasRouteState extends State<MisListasRoute> {
  static const _nombresListas = <String>[
    "Mayo 20",
    "Mayo 22",
    "Abril 25",
    "Mayo 24",
    "Julio 1",
  ];

  static const _tonListas = <String>[
    "C",
    "F",
    "G",
    "Bb",
    "Eb",
  ];

  var listaItems = List<ListaItem>();
  final listaDeListas =
      fillListasList(); //obviamente esta se deberia de llenar con datos de firebase

  static List<Lista> fillListasList() {
    var list = List<Lista>();
    for (var i = 0; i < _nombresListas.length; i++) {
      list.add(Lista(
        nombre: _nombresListas[i],
        tonalidad: _tonListas[i],
      ));
    }
    return list;
  }

  Widget _buildListaItemWidget(List<ListaItem> listas) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => listas[index],
      itemCount: listas.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (listaItems.isEmpty) {
      for (var i = 0; i < listaDeListas.length; i++) {
        listaItems.add(ListaItem(
          lista: listaDeListas[i],
        ));
      }
    }

    final listView = Container(
      padding: EdgeInsets.all(8.0),
      child: _buildListaItemWidget(listaItems),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Mis Listas"),),
      drawer: CustomDrawer(),
      body: Container(
        child: listView,
      ),
    );
  }
}
