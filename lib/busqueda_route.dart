import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himnario/minor_widgets/coro_en_busqueda.dart';
import 'package:himnario/data/coro.dart';

class BusquedaRoute extends StatefulWidget {
  @override
  _BusquedaRouteState createState() => _BusquedaRouteState();
}

class _BusquedaRouteState extends State<BusquedaRoute> {
  bool checkboxTodosValue = true;
  bool checkboxRapidosValue = false;
  bool checkboxLentosValue = false;
  bool checkboxMediosValue = false;
  static const groupTonalidad = 1;

  TextEditingController editingController = TextEditingController();

  var corosFiltrados = List<Coro>();
  final todosCoros = fillCorosList();

  var corosEnBusqueda = <CoroEnBusqueda>[];

  static const _nombres = <String>[
    "A Aquel que es Poderoso",
    "A Cristo Coronad",
    "Somos la Circunsicion que Alaba en Espiritu",
    "A Jehova yo Cantare",
    "A El Sea Gloria y Poder",
    "A Solas con Dios",
    "De Jehova Cantare yo las Misericordias",
    "A Aquel que es Poderoso",
    "A Cristo Coronad",
    "A Dios sea la Gloria",
    "A Jehova yo Cantare",
    "A El Sea Gloria y Poder",
    "A Solas con Dios",
    "De Jehova Cantare yo las Misericordias"
  ];

  static const _searchNames = <String>[
    "a aquel que es poderoso",
    "a cristo coronad",
    "somos la circunsicion que alaba en espiritu",
    "a jehova yo cantare",
    "a el sea gloria y poder",
    "a solas con dios",
    "de jehova cantare yo las misericordias",
    "a aquel que es poderoso",
    "a cristo coronad",
    "somos la circunsicion que alaba en espiritu",
    "a jehova yo cantare",
    "a el sea gloria y poder",
    "a solas con dios",
    "de jehova cantare yo las misericordias",
  ];

  static const _velocidades = <String>[
    "Lento",
    "Medio",
    "Lento",
    "Medio",
    "Rapido",
    "Lento",
    "Rapido",
    "Lento",
    "Medio",
    "Lento",
    "Medio",
    "Rapido",
    "Lento",
    "Rapido"
  ];

  static const _ids = <int>[1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7];
  static const _tiempos = <int>[1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7];
  static const _ordenes = <int>[1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7];

  static const _status = <String>[
    "",
    "",
    "n",
    "",
    "n",
    "Nuevo",
    "",
    "",
    "",
    "nuevo",
    "",
    "n",
    "n",
    ""
  ];

  static const _cuerpos = <String>[
    "",
    "",
    "n",
    "",
    "n",
    "Nuevo",
    "",
    "",
    "",
    "nuevo",
    "",
    "n",
    "n",
    ""
  ];

  static const _tonalidades = <String>[
    "F",
    "C",
    "G",
    "C",
    "Bb",
    "Bb",
    "Eb",
    "F",
    "C",
    "F",
    "C",
    "Bb",
    "Bb",
    "Eb"
  ];
  static const _autMusica = <String>[
    "F",
    "C",
    "F",
    "C",
    "Bb",
    "Bb",
    "Eb",
    "F",
    "C",
    "F",
    "C",
    "Bb",
    "Bb",
    "Eb"
  ];
  static const _autLetra = <String>[
    "F",
    "C",
    "F",
    "C",
    "Bb",
    "Bb",
    "Eb",
    "F",
    "C",
    "F",
    "C",
    "Bb",
    "Bb",
    "Eb"
  ];

  @override
  void initState() {
    corosFiltrados.addAll(todosCoros);
    super.initState();
  }

  static List<Coro> fillCorosList() {
    var lista = List<Coro>();
    //eliminate this when paired with firebase pero si tendria que llenar la lista de coros aqui desde Firebase
    for (var i = 0; i < _nombres.length; i++) {
      lista.add(Coro(
        id: _ids[i],
        nombre: _nombres[i],
        searchName: _searchNames[i],
        cuerpo: _cuerpos[i],
        tonalidad: _tonalidades[i],
        velocidad: _velocidades[i],
        tiempo: _tiempos[i],
        orden: _ordenes[i],
        autorLetra: _autLetra[i],
        autorMusica: _autMusica[i],
        status: _status[i],
      ));
    }
    return lista;
  }

  Widget _buildCoroEnBusquedaWidget(List<CoroEnBusqueda> coros) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => coros[index],
      itemCount: coros.length,
    );
  }

  void filterSearchResults(String query) {
    List<Coro> tempSearchList = List<Coro>();
    tempSearchList.addAll(todosCoros);

    if (query.isNotEmpty || query != "") {
      print("$query.5");
      List<Coro> tempFilteredList = List<Coro>();
      tempSearchList.forEach((coro) {
        if (coro.searchName.contains(query)) {
          tempFilteredList.add(coro);
        }
      });
      setState(() {
        corosFiltrados.clear();
        corosFiltrados.addAll(tempFilteredList);
      });
    } else {
      setState(() {
        corosFiltrados.clear();
        corosFiltrados.addAll(todosCoros);
      });

    }

    corosEnBusqueda.clear();
    for (var i = 0; i < corosFiltrados.length; i++) {
      corosEnBusqueda.add(CoroEnBusqueda(
        coro: corosFiltrados[i],
      ));
    }
  }

  Widget _buildSearchFieldWidget() {
    return TextField(
        controller: editingController,
        onChanged: (value) {
          filterSearchResults(value);
        },
        decoration: InputDecoration(hintText: "Buscar..."));
  }

  Widget _buildDialogContentWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text("Tonalidad",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Todos"),
                            Radio(
                              value: 1,
                              groupValue: groupTonalidad,
                              onChanged: (value) {
                                print(value);

                                //TODO: setState
//                          setState((){
//                            groupTonalidad = value;
//                          });
                              },
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("C"),
                            Radio(
                              value: 2,
                              groupValue: groupTonalidad,
                              onChanged: (value) {
                                print(value);

                                //TODO: setState
//                          setState((){
//                            groupTonalidad = value;
//                          });
                              },
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("Eb"),
                            Radio(
                              value: 3,
                              groupValue: groupTonalidad,
                              onChanged: (value) {
                                print(value);

                                //TODO: setState
//                          setState((){
//                            groupTonalidad = value;
//                          });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("F"),
                            Radio(
                              value: 4,
                              groupValue: groupTonalidad,
                              onChanged: (value) {
                                print(value);

                                //TODO: setState
//                          setState((){
//                            groupTonalidad = value;
//                          });
                              },
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("G"),
                            Radio(
                              value: 5,
                              groupValue: groupTonalidad,
                              onChanged: (value) {
                                print(value);

                                //TODO: setState
//                          setState((){
//                            groupTonalidad = value;
//                          });
                              },
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("Bb"),
                            Radio(
                              value: 6,
                              groupValue: groupTonalidad,
                              onChanged: (value) {
                                print(value);

                                //TODO: setState
//                          setState((){
//                            groupTonalidad = value;
//                          });
                              },
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("Velocidad",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                ),
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Todos"),
                          Checkbox(
                            //TODO: has to change this value
                            value: checkboxTodosValue,
                            onChanged: (bool value) {
                              print(value);
                              //TODO: setState
                              //   setState(() {})
                            },
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Rapidos"),
                          Checkbox(
                            //TODO: has to change this value
                            value: checkboxRapidosValue,
                            onChanged: (bool value) {
                              print(value);
                              //TODO: setState
                              //   setState(() {})
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Medios"),
                          Checkbox(
                            //TODO: has to change this value
                            value: checkboxMediosValue,
                            onChanged: (bool value) {
                              print(value);
                              //TODO: setState
                              //   setState(() {})
                            },
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("Lentos"),
                          Checkbox(
                            //TODO: has to change this value
                            value: checkboxLentosValue,
                            onChanged: (bool value) {
                              print(value);
                              //TODO: setState
                              //   setState(() {})
                            },
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _buildFilterDialog(BuildContext context) {
    return (showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Filtros"),
          content: _buildDialogContentWidget(),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              //TODO: Cambiar filtro con setState
              elevation: 5.0,
              child: Text("Filtrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (corosEnBusqueda.isEmpty) {
      for (var i = 0; i < corosFiltrados.length; i++) {
        corosEnBusqueda.add(CoroEnBusqueda(
          coro: corosFiltrados[i],
        ));
      }
    }

    final listView = Container(
      child: _buildCoroEnBusquedaWidget(corosEnBusqueda),
    );

    final appBar = AppBar(
      title: Text("Búsqueda"),
    );

    //TODO: Implement navigation and styling
    final drawer = Drawer(
        child: ListView(
      children: <Widget>[
        ListTile(leading: Icon(Icons.search), title: Text("Búsqueda")),
        ListTile(leading: Icon(Icons.list), title: Text("Mis Listas")),
        ListTile(leading: Icon(Icons.settings), title: Text("Ajustes")),
      ],
    ));

    final search = Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 1.0, 2.0, 0.0),
              child: _buildSearchFieldWidget(),
            ),
          ),
          RaisedButton(
            onPressed: () {
              _buildFilterDialog(context);
            },
            color: Colors.lightGreen,
            child: Icon(Icons.filter_list, color: Colors.white),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(2.0),
              child: search,
            ),
            Expanded(
              child: listView,
            )
          ],
        ),
      ),
    );
  }
}
